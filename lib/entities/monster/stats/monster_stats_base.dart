part of monster;

class DefaultEntityMonsterStatsBase {
  static const num defaultValue = 100;
  static const num maxStamina = 500;
}

mixin EntityMonsterStatsBase {
  EntityClass get classes;

  void _initStatsBaseValues() async {}
}
