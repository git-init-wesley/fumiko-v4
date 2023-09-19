import 'package:fumiko/utils/assets/assets_images.dart';

mixin EntityClass {
  String get code;

  String get name;

  AssetsImage get icon;

  AssetsImage get graphics;

  String get description;

  num get strength;

  num get dexterity;

  num get agility;

  num get vitality;

  num get endurance;

  num get eyesight;

  num get mass;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityClass &&
          runtimeType == other.runtimeType &&
          code == other.code;

  @override
  int get hashCode => code.hashCode;

  @override
  String toString() {
    return 'EntityClass{code: $code, name: $name, icon: $icon, graphics: $graphics, description: $description, strength: $strength, dexterity: $dexterity, agility: $agility, vitality: $vitality, endurance: $endurance, eyesight: $eyesight, mass: $mass}';
  }
}
