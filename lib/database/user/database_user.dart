library database_user;

import 'dart:async';

import 'package:fumiko/database/database.dart';

part './balance/database_user_balance.dart';
part './leveling/database_user_leveling.dart';
part './stats/database_stats_base.dart';
part './stats/database_stats_primary.dart';

class DatabaseUserPaths {
  DatabaseUserPaths._();

  static username(String uid) => 'users/$uid/username';

  static power(String uid) => 'users/$uid/power';

  static classes(String uid) => 'users/$uid/classes';
}

class DatabaseUser with Database, _DatabaseUserLeveling, _DatabaseUserBalance, _DatabaseUserStatsBase, _DatabaseUserStatsPrimary {
  String? _uid;

  @override
  Future<DatabaseResult<V?>> getValue<V>({required String path}) => super.getValue(path: path);

  @override
  Future<DatabaseResult<V?>> setValue<V>({required String path, required V? value}) => super.setValue(path: path, value: value);

  @override
  Future<StreamSubscription> addObserver<V>({required String path, required DatabaseListen<V?> listen}) => super.addObserver(path: path, listen: listen);

  @override
  String get uid => _uid ?? '...';

  DatabaseUser._();

  DatabaseUser.of({required String uid}) : _uid = uid;

  Future<DatabaseResult<String?>> getUsername() async => await super.getValue<String>(path: DatabaseUserPaths.username(uid));

  Future<DatabaseResult<String?>> setUsername(String? value) async => await super.setValue<String>(path: DatabaseUserPaths.username(uid), value: value);

  Future<StreamSubscription> observeUsername(DatabaseListen<String?> listen) async => await super.addObserver<String?>(path: DatabaseUserPaths.username(uid), listen: listen);

  Future<DatabaseResult<num?>> getPower() async => await getValue<num?>(path: DatabaseUserPaths.power(uid));

  Future<DatabaseResult<num?>> setPower(num? newPower) async => await setValue<num?>(path: DatabaseUserPaths.power(uid), value: newPower);

  Future<StreamSubscription?> observePower(DatabaseListen<num?> listen) async => await addObserver(path: DatabaseUserPaths.power(uid), listen: listen);

  Future<DatabaseResult<String?>> getClasses() async => await getValue<String?>(path: DatabaseUserPaths.classes(uid));

  Future<DatabaseResult<String?>> setClasses(String? newClasses) async => await setValue<String?>(path: DatabaseUserPaths.classes(uid), value: newClasses);

  Future<StreamSubscription?> observeClasses(DatabaseListen<String?> listen) async => await addObserver(path: DatabaseUserPaths.classes(uid), listen: listen);
}
