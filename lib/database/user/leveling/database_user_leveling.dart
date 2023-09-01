part of database_user;

class DatabaseUserLevelingPaths {
  DatabaseUserLevelingPaths._();

  static levels(String uid) => 'users/$uid/leveling/levels';

  static rebirths(String uid) => 'users/$uid/leveling/rebirths';

  static exp(String uid) => 'users/$uid/leveling/exp';
}

abstract class _DatabaseUserLeveling with Database {
  String get uid;

  Future<num?> getLevels() async => (await getValue<num?>(path: DatabaseUserLevelingPaths.levels(uid))).value;

  Future<num?> setLevels(num? newLevels) async => (await setValue<num?>(path: DatabaseUserLevelingPaths.levels(uid), value: newLevels)).value;

  Future<StreamSubscription?> observeLevels(DatabaseListen<num?> listen) async => await addObserver(path: DatabaseUserLevelingPaths.levels(uid), listen: listen);

  Future<num?> getRebirths() async => (await getValue<num?>(path: DatabaseUserLevelingPaths.rebirths(uid))).value;

  Future<num?> setRebirths(num? newRebirths) async => (await setValue<num?>(path: DatabaseUserLevelingPaths.rebirths(uid), value: newRebirths)).value;

  Future<StreamSubscription?> observeRebirths(DatabaseListen<num?> listen) async => await addObserver(path: DatabaseUserLevelingPaths.rebirths(uid), listen: listen);

  Future<num?> getExp() async => (await getValue<num?>(path: DatabaseUserLevelingPaths.exp(uid))).value;

  Future<num?> setExp(num? newExp) async => (await setValue<num?>(path: DatabaseUserLevelingPaths.exp(uid), value: newExp)).value;

  Future<StreamSubscription?> observeExp(DatabaseListen<num?> listen) async => await addObserver(path: DatabaseUserLevelingPaths.exp(uid), listen: listen);
}
