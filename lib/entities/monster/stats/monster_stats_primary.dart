part of monster;

mixin EntityMonsterStatsPrimary implements EntityStatsPrimary {
  MonsterClass get classes;

  num? _strength = DefaultEntityMonsterStatsBase.defaultValue;

  @override
  num get strength => _strength ?? 0;

  num get realStrength => strength * classes.strength;

  num? _dexterity = DefaultEntityMonsterStatsBase.defaultValue;

  @override
  num get dexterity => _dexterity ?? 0;

  num get realDexterity => dexterity * classes.dexterity;

  num? _agility = DefaultEntityMonsterStatsBase.defaultValue;

  @override
  num get agility => _agility ?? 0;

  num get realAgility => agility * classes.agility;

  num? _vitality = DefaultEntityMonsterStatsBase.defaultValue;

  @override
  num get vitality => _vitality ?? 0;

  num get realVitality => vitality * classes.vitality;

  num? _endurance = DefaultEntityMonsterStatsBase.defaultValue;

  @override
  num get endurance => _endurance ?? 0;

  num get realEndurance => endurance * classes.endurance;

  num? _eyesight = DefaultEntityMonsterStatsBase.defaultValue;

  @override
  num get eyesight => _eyesight ?? 0;

  num get realEyesight => eyesight * classes.eyesight;

  num? _mass = DefaultEntityMonsterStatsBase.defaultValue;

  @override
  num get mass => _mass ?? 0;

  num get realMass => mass * classes.mass;

  void _initStatsPrimaryValues({num? strength, num? dexterity, num? agility, num? vitality, num? endurance, num? eyesight, num? mass}) async {
    _strength = strength;
    _dexterity = dexterity;
    _agility = agility;
    _vitality = vitality;
    _endurance = endurance;
    _eyesight = eyesight;
    _mass = mass;
  }
}
