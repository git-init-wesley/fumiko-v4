library database_user;

import 'dart:async';

import 'package:fumiko/database/database.dart';

part './leveling/database_user_leveling.dart';

class DatabaseUserPaths {
  DatabaseUserPaths._();

  static username(String uid) => 'users/$uid/username';
}

class DatabaseUser extends _DatabaseUserLeveling with Database {
  String? _uid;

  @override
  String get uid => _uid ?? '...';

  DatabaseUser._();

  DatabaseUser.of({required String uid}) : _uid = uid;

  Future<String?> getUsername() async => (await super.getValue<String>(path: DatabaseUserPaths.username(uid))).value;

  Future<String?> setUsername(String? value) async => (await super.setValue<String>(path: DatabaseUserPaths.username(uid), value: value)).value;

  Future<StreamSubscription> observeUsername(DatabaseListen<String?> listen) async => await super.addObserver<String?>(path: DatabaseUserPaths.username(uid), listen: listen);
}
