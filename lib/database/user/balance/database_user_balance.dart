part of database_user;

class DatabaseUserBalancePaths {
  DatabaseUserBalancePaths._();

  static primary(String uid) => 'users/$uid/balance/primary';

  static secondary(String uid) => 'users/$uid/balance/secondary';

  static trophies(String uid) => 'users/$uid/balance/trophies';
}

mixin _DatabaseUserBalance {
  String get uid;

  Future<DatabaseResult<V?>> getValue<V>({required String path});

  Future<DatabaseResult<V?>> setValue<V>({required String path, required V? value});

  Future<StreamSubscription> addObserver<V>({required String path, required DatabaseListen<V?> listen});

  Future<DatabaseResult<num?>> getPrimary() async => await getValue<num?>(path: DatabaseUserBalancePaths.primary(uid));

  Future<DatabaseResult<num?>> setPrimary(num? newPrimary) async => await setValue<num?>(path: DatabaseUserBalancePaths.primary(uid), value: newPrimary);

  Future<StreamSubscription?> observePrimary(DatabaseListen<num?> listen) async => await addObserver(path: DatabaseUserBalancePaths.primary(uid), listen: listen);

  Future<DatabaseResult<num?>> getSecondary() async => await getValue<num?>(path: DatabaseUserBalancePaths.secondary(uid));

  Future<DatabaseResult<num?>> setSecondary(num? newSecondary) async => await setValue<num?>(path: DatabaseUserBalancePaths.secondary(uid), value: newSecondary);

  Future<StreamSubscription?> observeSecondary(DatabaseListen<num?> listen) async => await addObserver(path: DatabaseUserBalancePaths.secondary(uid), listen: listen);

  Future<DatabaseResult<num?>> getTrophies() async => await getValue<num?>(path: DatabaseUserBalancePaths.trophies(uid));

  Future<DatabaseResult<num?>> setTrophies(num? newTrophies) async => await setValue<num?>(path: DatabaseUserBalancePaths.trophies(uid), value: newTrophies);

  Future<StreamSubscription?> observeTrophies(DatabaseListen<num?> listen) async => await addObserver(path: DatabaseUserBalancePaths.trophies(uid), listen: listen);
}
