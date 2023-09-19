part of database_user;

class DatabaseUserStatsBasePaths {
  DatabaseUserStatsBasePaths._();

  static stamina(String uid) => 'users/$uid/stats/stamina';
}

mixin _DatabaseUserStatsBase {
  String get uid;

  Future<DatabaseResult<V?>> getValue<V>({required String path});

  Future<DatabaseResult<V?>> setValue<V>(
      {required String path, required V? value});

  Future<StreamSubscription> addObserver<V>(
      {required String path, required DatabaseListen<V?> listen});

  Future<DatabaseResult<num?>> getStamina() async =>
      await getValue<num?>(path: DatabaseUserStatsBasePaths.stamina(uid));

  Future<DatabaseResult<num?>> setStamina(num? newStamina) async =>
      await setValue<num?>(
          path: DatabaseUserStatsBasePaths.stamina(uid), value: newStamina);

  Future<StreamSubscription?> observeStamina(
          DatabaseListen<num?> listen) async =>
      await addObserver(
          path: DatabaseUserStatsBasePaths.stamina(uid), listen: listen);
}
