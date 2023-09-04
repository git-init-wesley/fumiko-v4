part of database_user;

class DatabaseUserStatsBasePaths {
  DatabaseUserStatsBasePaths._();

  static health(String uid) => 'users/$uid/stats/health';

  static stamina(String uid) => 'users/$uid/stats/stamina';
}

mixin _DatabaseUserStatsBase {
  String get uid;

  Future<DatabaseResult<V?>> getValue<V>({required String path});

  Future<DatabaseResult<V?>> setValue<V>({required String path, required V? value});

  Future<StreamSubscription> addObserver<V>({required String path, required DatabaseListen<V?> listen});

  Future<DatabaseResult<num?>> getHealth() async => await getValue<num?>(path: DatabaseUserStatsBasePaths.health(uid));

  Future<DatabaseResult<num?>> setHealth(num? newHealth) async => await setValue<num?>(path: DatabaseUserStatsBasePaths.health(uid), value: newHealth);

  Future<StreamSubscription?> observeHealth(DatabaseListen<num?> listen) async => await addObserver(path: DatabaseUserStatsBasePaths.health(uid), listen: listen);

  Future<DatabaseResult<num?>> getStamina() async => await getValue<num?>(path: DatabaseUserStatsBasePaths.stamina(uid));

  Future<DatabaseResult<num?>> setStamina(num? newStamina) async => await setValue<num?>(path: DatabaseUserStatsBasePaths.stamina(uid), value: newStamina);

  Future<StreamSubscription?> observeStamina(DatabaseListen<num?> listen) async => await addObserver(path: DatabaseUserStatsBasePaths.stamina(uid), listen: listen);
}
