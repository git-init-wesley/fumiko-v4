import 'dart:async';

import 'package:fumiko/database/database.dart';

class DatabaseUserPaths {
  DatabaseUserPaths._();

  static username(String uid) => 'users/$uid/username';
}

class DatabaseUser with Database {
  String? _uid;

  //@override
  String get uid => _uid ?? '...';

  DatabaseUser._();

  DatabaseUser.of({required String uid}) : _uid = uid;

  Future<String?> getUsername() async => (await super.getValue<String>(path: DatabaseUserPaths.username(uid))).value;

  Future<String?> setUsername(String? value) async => (await super.setValue<String>(path: DatabaseUserPaths.username(uid), value: value)).value;

  Future<StreamSubscription> observeUsername(DatabaseListen<String?> listen) async => await super.addObserver<String?>(path: DatabaseUserPaths.username(uid), listen: listen);
}
