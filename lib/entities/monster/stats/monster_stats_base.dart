part of monster;

class DefaultEntityMonsterStatsBase {
  static const num defaultValue = 50;
  static const num maxStamina = 500;
}

mixin EntityMonsterStatsBase {
  MonsterClass get classes;

  void _initStatsBaseValues() async {}
}
