part of entity;

mixin EntityLeveling {
  num get levels;

  num get rebirths;

  num get realLevels => levels + (rebirths * 100);
}
