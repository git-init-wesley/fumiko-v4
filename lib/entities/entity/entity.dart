library entity;

part './stats/entity_stats_primary.dart';

mixin Entity implements EntityStatsPrimary {
  String get name;
}
