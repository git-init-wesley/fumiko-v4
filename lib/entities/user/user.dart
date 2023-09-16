library user;

import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fumiko/core/user/core_user.dart';
import 'package:fumiko/database/database.dart';
import 'package:fumiko/database/user/database_user.dart';
import 'package:fumiko/entities/entity/entity.dart';
import 'package:fumiko/entities/user/classes/user_classes.dart';
import 'package:fumiko/utils/change_listener.dart';

part './balances/user_balances.dart';
part './leveling/user_leveling.dart';
part './presence/user_presence.dart';
part './stats/user_stats_base.dart';
part './stats/user_stats_primary.dart';

typedef EntityUserChangeListener = DatabaseResult<dynamic>?;
typedef EntityUserDidSetValue<T> = Function(T oldValue, T newValue);

class EntityUserValue<T> {
  final EntityUserDidSetValue<T>? _didSet;

  T _value;

  T get value => _value;

  Future<T> _set(T newValue) async {
    final oldValue = _value;
    _value = newValue;
    if (_didSet != null) await _didSet!(oldValue, newValue);
    return _value;
  }

  EntityUserValue({EntityUserDidSetValue<T>? didSet, required T value})
      : _didSet = didSet,
        _value = value;
}

class EntityUser with Entity, EntityUserLeveling, EntityUserBalances, EntityUserStatsBase, EntityUserStatsPrimary, ChangeListener<EntityUserChangeListener> {
  String? _uid;

  String? get uid => _uid;

  EntityUserValue<String?> _username = EntityUserValue<String>(value: '...');

  String get username => _username.value ?? 'X';
  StreamSubscription? _usernameObserver;

  @override
  String get name => username;

  Future<String?> setUsername(String newUsername) async => await _username._set(newUsername);

  EntityUserValue<UserClass?> _classes = EntityUserValue<UserClass>(value: UserClasses.unknown);

  @override
  UserClass get classes => _classes.value ?? UserClasses.unknown;
  StreamSubscription? _classesObserver;

  Future<UserClass?> setClasses(UserClass newClasses) async => await _classes._set(newClasses);

  EntityUserValue<num?> _power = EntityUserValue<num>(value: 0);

  num get power => _power.value ?? 0;
  StreamSubscription? _powerObserver;

  @override
  num get levels => _levels.value ?? 0;

  EntityUser();

  EntityUser.of({String? uid, required VoidCallback whenComplete}) {
    _uid = uid;
    _get().whenComplete(whenComplete);
  }

  EntityUser.load(VoidCallback whenComplete) {
    _uid = FirebaseAuth.instance.currentUser?.uid;
    _get().whenComplete(() => _init().whenComplete(whenComplete));
  }

  Future<void> _init() async {
    _initBaseValues();
    _initLevelingValues(uid: uid);
    _initBalanceValues(uid: uid);
    _initStatsBaseValues(uid: uid);
    _initStatsPrimaryValues(uid: uid);

    await _initBaseObservers();
    await _initLevelingObservers(uid: uid, onChange: onChange);
    await _initBalanceObservers(uid: uid, onChange: onChange);
    await _initStatsBaseObservers(uid: uid, onChange: onChange);
    await _initStatsPrimaryObservers(uid: uid, onChange: onChange);
  }

  Future<void> _get() async {
    if (!CoreUser.instance.isAuthenticated || !CoreUser.instance.isLoaded || uid == null) return;
    await _getBaseValues();
    await _getLevelingValues(uid: uid!);
    await _getBalanceValues(uid: uid!);
    await _getStatsBaseValues(uid: uid!);
    await _getStatsPrimaryValues(uid: uid!);
  }

  Future<void> _getBaseValues() async {
    _username = EntityUserValue<String?>(value: (await DatabaseUser.of(uid: uid!).getUsername()).value ?? 'N/A');
    _classes = EntityUserValue<UserClass?>(value: UserClasses.fromCode((await DatabaseUser.of(uid: uid!).getClasses()).value));
    _power = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid!).getPower()).value ?? 0);
  }

  void _initBaseValues() {
    _username = EntityUserValue<String>(
      didSet: (String oldUsername, String newUsername) async {
        if (oldUsername == newUsername) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid!).setUsername(newUsername));
        }
      },
      value: 'N/A',
    );
    _classes = EntityUserValue<UserClass>(
      didSet: (UserClass oldClass, UserClass newClass) async {
        if (oldClass == newClass) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid!).setClasses(newClass.code));
          updatePower();
        }
      },
      value: UserClasses.unknown,
    );
    _power = EntityUserValue<num>(
      didSet: (num oldPower, num newPower) async {
        if (oldPower == newPower) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid!).setPower(newPower));
        }
      },
      value: 0,
    );
  }

  Future<void> _initBaseObservers() async {
    _usernameObserver = await DatabaseUser.of(uid: uid!).observeUsername((value) async {
      if (value != _username.value) await _username._set(value ?? 'N/A');
      onChange(null);
    });
    _classesObserver = await DatabaseUser.of(uid: uid!).observeClasses((value) async {
      if (value != _classes.value?.code) await _classes._set(UserClasses.fromCode(value));
      onChange(null);
      updatePower();
    });
    _powerObserver = await DatabaseUser.of(uid: uid!).observePower((value) async {
      if (value != _power.value) await _power._set(value ?? 0);
      onChange(null);
    });
  }

  Future<void> _destroyBaseObservers() async {
    await Database.removeObserver(streamSubscription: _usernameObserver);
    await Database.removeObserver(streamSubscription: _classesObserver);
    await Database.removeObserver(streamSubscription: _powerObserver);
    _usernameObserver = null;
    _classesObserver = null;
    _powerObserver = null;
  }

  Future<void> destroy() async {
    disposeListeners();
    await _destroyBaseObservers();
    await _destroyLevelingObservers();
    await _destroyBalanceObservers();
    await _destroyStatsBaseObservers();
    await _destroyStatsPrimaryObservers();
  }

  @override
  Future<void> onChange(EntityUserChangeListener obj) {
    return super.onChange.call(obj);
  }

  @override
  void updatePower() async {
    num algo = (realStrength + realDexterity + realAgility + realVitality + realEndurance + realEyesight + realMass) - 200;
    await _power._set(num.tryParse(algo.toStringAsFixed(0)) ?? 0);
    onChange(null);
  }
}
