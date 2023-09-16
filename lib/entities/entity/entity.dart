library entity;

import 'package:fumiko/entities/entity/classes/entity_classes.dart';

part './stats/entity_stats_primary.dart';

mixin Entity implements EntityStatsPrimary {
  String get name;

  num get power;

  EntityClass get classes;
}

class EntityFight {
  num _actualVitality;

  num get actualVitality => _actualVitality;

  set actualVitality(v) => _actualVitality = v;
  Entity entity;

  EntityFight({required this.entity}) : _actualVitality = entity.realVitality;
}
