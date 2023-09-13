library monster;

import 'dart:core';

import 'package:fumiko/entities/entity/entity.dart';
import 'package:fumiko/entities/monster/classes/monster_classes.dart';

part './stats/monster_stats_base.dart';
part './stats/monster_stats_primary.dart';

class EntityMonster with Entity, EntityMonsterStatsBase, EntityMonsterStatsPrimary {
  bool? _isBoss = false;

  bool get isBoss => _isBoss ?? false;

  num? _levels = 0;

  num get levels => _levels ?? 0;

  MonsterClass? _classes = MonsterClasses.unknown;

  @override
  MonsterClass get classes => _classes ?? MonsterClasses.unknown;

  num? _power = 0;

  num get power => _power ?? 0;

  EntityMonster._();

  EntityMonster.of({required num levels, required bool isBoss, required MonsterClass classes}) {
    _isBoss = isBoss;
    _classes = classes;
    _levels = levels;
    _init();
  }

  void _init() async {
    final num delta = DefaultEntityMonsterStatsBase.defaultValue * (isBoss ? 1.5 : 1) * levels;
    _initStatsBaseValues();
    _initStatsPrimaryValues(
      strength: delta,
      dexterity: delta,
      agility: delta,
      vitality: delta,
      endurance: delta,
      eyesight: delta,
      mass: delta,
    );
    updatePower();
  }

  void updatePower() {
    final algo = (realStrength + realDexterity + realAgility + realVitality + realEndurance + realEyesight + realMass);
    _power = algo;
  }

  @override
  String get name => classes.name;
}
