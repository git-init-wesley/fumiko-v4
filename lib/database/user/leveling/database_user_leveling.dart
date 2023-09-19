part of database_user;

class DatabaseUserLevelingPaths {
  DatabaseUserLevelingPaths._();

  static levels(String uid) => 'users/$uid/leveling/levels';

  static rebirths(String uid) => 'users/$uid/leveling/rebirths';

  static exp(String uid) => 'users/$uid/leveling/exp';
}

mixin _DatabaseUserLeveling {
  String get uid;

  Future<DatabaseResult<V?>> getValue<V>({required String path});

  Future<DatabaseResult<V?>> setValue<V>(
      {required String path, required V? value});

  Future<StreamSubscription> addObserver<V>(
      {required String path, required DatabaseListen<V?> listen});

  Future<DatabaseResult<num?>> getLevels() async =>
      await getValue<num?>(path: DatabaseUserLevelingPaths.levels(uid));

  Future<DatabaseResult<num?>> setLevels(num? newLevels) async =>
      await setValue<num?>(
          path: DatabaseUserLevelingPaths.levels(uid), value: newLevels);

  Future<StreamSubscription?> observeLevels(
          DatabaseListen<num?> listen) async =>
      await addObserver(
          path: DatabaseUserLevelingPaths.levels(uid), listen: listen);

  Future<DatabaseResult<num?>> getRebirths() async =>
      await getValue<num?>(path: DatabaseUserLevelingPaths.rebirths(uid));

  Future<DatabaseResult<num?>> setRebirths(num? newRebirths) async =>
      await setValue<num?>(
          path: DatabaseUserLevelingPaths.rebirths(uid), value: newRebirths);

  Future<StreamSubscription?> observeRebirths(
          DatabaseListen<num?> listen) async =>
      await addObserver(
          path: DatabaseUserLevelingPaths.rebirths(uid), listen: listen);

  Future<DatabaseResult<num?>> getExp() async =>
      await getValue<num?>(path: DatabaseUserLevelingPaths.exp(uid));

  Future<DatabaseResult<num?>> setExp(num? newExp) async =>
      await setValue<num?>(
          path: DatabaseUserLevelingPaths.exp(uid), value: newExp);

  Future<StreamSubscription?> observeExp(DatabaseListen<num?> listen) async =>
      await addObserver(
          path: DatabaseUserLevelingPaths.exp(uid), listen: listen);
}
