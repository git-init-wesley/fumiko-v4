import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fumiko/core/user/core_user.dart';
import 'package:fumiko/database/database.dart';
import 'package:fumiko/database/user/database_user.dart';
import 'package:fumiko/utils/change_listener.dart';

typedef EntityUserDidSetValue<T> = Function(T oldValue, T newValue);

class EntityUserValue<T> {
  final EntityUserDidSetValue<T>? _didSet;

  T _value;

  T get value => _value;

  Future<T> _set(T newValue) async {
    if (_didSet != null) await _didSet!(_value, newValue);
    return _value = newValue;
  }

  EntityUserValue({EntityUserDidSetValue<T>? didSet, required T value})
      : _didSet = didSet,
        _value = value;
}

class EntityUser with ChangeListener {
  String? get uid => FirebaseAuth.instance.currentUser?.uid;

  EntityUserValue<String?> _username = EntityUserValue<String>(value: '...');

  String? get username => _username.value;
  StreamSubscription? _usernameObserver;

  Future<String?> setUsername(String newUsername) async => await _username._set(newUsername);

  EntityUser();

  EntityUser.load(VoidCallback whenComplete) {
    _init().whenComplete(whenComplete);
  }

  Future<void> _init() async {
    _initBaseValues();

    await _initBaseObservers();
  }

  void _initBaseValues() {
    _username = EntityUserValue<String>(
      didSet: (String oldUsername, String newUsername) async {
        if (oldUsername == newUsername) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          DatabaseUser.of(uid: uid!).setUsername(newUsername);
        }
      },
      value: 'N/A',
    );
  }

  Future<void> _initBaseObservers() async {
    _usernameObserver = await DatabaseUser.of(uid: uid!).observeUsername((value) {
      if (value != _username.value) _username._set(value ?? 'N/A');
      onChange();
    });
  }

  Future<void> _destroyBaseObservers() async {
    await Database.removeObserver(streamSubscription: _usernameObserver);
  }

  Future<void> destroy() async {
    disposeListeners();
    await _destroyBaseObservers();
  }
}
