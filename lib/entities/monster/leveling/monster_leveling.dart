part of monster;

mixin EntityMonsterLeveling implements EntityLeveling {
  num? _levels;

  @override
  num get levels => _levels ?? 1;

  num? _rebirths;

  @override
  num get rebirths => _rebirths ?? 0;

  @override
  num get realLevels => levels + (rebirths * 100);
}
