part of database_user;

class DatabaseUserStatsPrimaryPaths {
  DatabaseUserStatsPrimaryPaths._();

  static strength(String uid) => 'users/$uid/stats/primary/strength';

  static dexterity(String uid) => 'users/$uid/stats/primary/dexterity';

  static agility(String uid) => 'users/$uid/stats/primary/agility';

  static vitality(String uid) => 'users/$uid/stats/primary/vitality';

  static endurance(String uid) => 'users/$uid/stats/primary/endurance';

  static eyesight(String uid) => 'users/$uid/stats/primary/eyesight';

  static mass(String uid) => 'users/$uid/stats/primary/mass';
}

mixin _DatabaseUserStatsPrimary {
  String get uid;

  Future<DatabaseResult<V?>> getValue<V>({required String path});

  Future<DatabaseResult<V?>> setValue<V>(
      {required String path, required V? value});

  Future<StreamSubscription> addObserver<V>(
      {required String path, required DatabaseListen<V?> listen});

  Future<DatabaseResult<num?>> getStrength() async =>
      await getValue<num?>(path: DatabaseUserStatsPrimaryPaths.strength(uid));

  Future<DatabaseResult<num?>> setStrength(num? newStrength) async =>
      await setValue<num?>(
          path: DatabaseUserStatsPrimaryPaths.strength(uid),
          value: newStrength);

  Future<StreamSubscription?> observeStrength(
          DatabaseListen<num?> listen) async =>
      await addObserver(
          path: DatabaseUserStatsPrimaryPaths.strength(uid), listen: listen);

  Future<DatabaseResult<num?>> getDexterity() async =>
      await getValue<num?>(path: DatabaseUserStatsPrimaryPaths.dexterity(uid));

  Future<DatabaseResult<num?>> setDexterity(num? newDexterity) async =>
      await setValue<num?>(
          path: DatabaseUserStatsPrimaryPaths.dexterity(uid),
          value: newDexterity);

  Future<StreamSubscription?> observeDexterity(
          DatabaseListen<num?> listen) async =>
      await addObserver(
          path: DatabaseUserStatsPrimaryPaths.dexterity(uid), listen: listen);

  Future<DatabaseResult<num?>> getAgility() async =>
      await getValue<num?>(path: DatabaseUserStatsPrimaryPaths.agility(uid));

  Future<DatabaseResult<num?>> setAgility(num? newAgility) async =>
      await setValue<num?>(
          path: DatabaseUserStatsPrimaryPaths.agility(uid), value: newAgility);

  Future<StreamSubscription?> observeAgility(
          DatabaseListen<num?> listen) async =>
      await addObserver(
          path: DatabaseUserStatsPrimaryPaths.agility(uid), listen: listen);

  Future<DatabaseResult<num?>> getVitality() async =>
      await getValue<num?>(path: DatabaseUserStatsPrimaryPaths.vitality(uid));

  Future<DatabaseResult<num?>> setVitality(num? newVitality) async =>
      await setValue<num?>(
          path: DatabaseUserStatsPrimaryPaths.vitality(uid),
          value: newVitality);

  Future<StreamSubscription?> observeVitality(
          DatabaseListen<num?> listen) async =>
      await addObserver(
          path: DatabaseUserStatsPrimaryPaths.vitality(uid), listen: listen);

  Future<DatabaseResult<num?>> getEndurance() async =>
      await getValue<num?>(path: DatabaseUserStatsPrimaryPaths.endurance(uid));

  Future<DatabaseResult<num?>> setEndurance(num? newEndurance) async =>
      await setValue<num?>(
          path: DatabaseUserStatsPrimaryPaths.endurance(uid),
          value: newEndurance);

  Future<StreamSubscription?> observeEndurance(
          DatabaseListen<num?> listen) async =>
      await addObserver(
          path: DatabaseUserStatsPrimaryPaths.endurance(uid), listen: listen);

  Future<DatabaseResult<num?>> getEyesight() async =>
      await getValue<num?>(path: DatabaseUserStatsPrimaryPaths.eyesight(uid));

  Future<DatabaseResult<num?>> setEyesight(num? newEyesight) async =>
      await setValue<num?>(
          path: DatabaseUserStatsPrimaryPaths.eyesight(uid),
          value: newEyesight);

  Future<StreamSubscription?> observeEyesight(
          DatabaseListen<num?> listen) async =>
      await addObserver(
          path: DatabaseUserStatsPrimaryPaths.eyesight(uid), listen: listen);

  Future<DatabaseResult<num?>> getMass() async =>
      await getValue<num?>(path: DatabaseUserStatsPrimaryPaths.mass(uid));

  Future<DatabaseResult<num?>> setMass(num? newMass) async =>
      await setValue<num?>(
          path: DatabaseUserStatsPrimaryPaths.mass(uid), value: newMass);

  Future<StreamSubscription?> observeMass(DatabaseListen<num?> listen) async =>
      await addObserver(
          path: DatabaseUserStatsPrimaryPaths.mass(uid), listen: listen);
}
