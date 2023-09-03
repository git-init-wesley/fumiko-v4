import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/utils/assets/assets_images.dart';

class UserClass {
  final String _code;

  String get code => _code;

  final AssetsImage _image;

  AssetsImage get icon => _image;

  final AssetsImage _graphics;

  AssetsImage get graphics => _graphics;

  final String _description;

  String get description => _description;

  final num _strength;

  num get strength => _strength;

  final num _dexterity;

  num get dexterity => _dexterity;

  final num _agility;

  num get agility => _agility;

  final num _vitality;

  num get vitality => _vitality;

  final num _endurance;

  num get endurance => _endurance;

  final num _eyesight;

  num get eyesight => _eyesight;

  final num _mass;

  num get mass => _mass;

  UserClass(
      {required String code,
      required AssetsImage image,
      required AssetsImage graphics,
      required String description,
      required num strength,
      required num dexterity,
      required num agility,
      required num vitality,
      required num endurance,
      required num eyesight,
      required num mass})
      : _code = code,
        _image = image,
        _graphics = graphics,
        _description = description,
        _strength = strength,
        _dexterity = dexterity,
        _agility = agility,
        _vitality = vitality,
        _endurance = endurance,
        _eyesight = eyesight,
        _mass = mass;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserClass && runtimeType == other.runtimeType && _code == other._code;

  @override
  int get hashCode => _code.hashCode;
}

class UserClasses {
  UserClasses._();

  static final List<UserClass> _classes = [
    //TODO: Remake stats
    UserClass(
      code: 'mage',
      image: AssetsImages.mageIcon,
      graphics: AssetsImages.mageIcon,
      description: AppLocalizations.current.mageDescription,
      strength: 0.8,
      dexterity: 0.8,
      agility: 1,
      vitality: 1,
      endurance: 1.2,
      eyesight: 1.5,
      mass: 1,
    ),
    //TODO: Remake stats
    UserClass(
      code: 'warrior',
      image: AssetsImages.warriorIcon,
      graphics: AssetsImages.warriorIcon,
      description: AppLocalizations.current.warriorDescription,
      strength: 1.5,
      dexterity: 0.8,
      agility: 0.8,
      vitality: 1.5,
      endurance: 0.8,
      eyesight: 0.8,
      mass: 1.3,
    ),
    //TODO: Remake stats
    UserClass(
      code: 'ninja',
      image: AssetsImages.ninjaIcon,
      graphics: AssetsImages.ninjaIcon,
      description: AppLocalizations.current.ninjaDescription,
      strength: 0.5,
      dexterity: 1.3,
      agility: 1.3,
      vitality: 0.75,
      endurance: 1.5,
      eyesight: 1.5,
      mass: 0.8,
    ),
  ];

  static final UserClass _unknown = UserClass(
    code: 'unknown',
    image: AssetsImages.fumikoIcon,
    graphics: AssetsImages.fumikoIcon,
    description: 'N/A',
    strength: 0,
    dexterity: 0,
    agility: 0,
    vitality: 0,
    endurance: 0,
    eyesight: 0,
    mass: 0,
  );

  static UserClass get unknown => _unknown;

  static List<UserClass> get classes => _classes;

  static List<String> get classesCode => classes.map((e) => e.code).toList();

  static Map<String, UserClass> get mapClassesCode => Map.fromIterables(classesCode, classes);

  static UserClass fromCode(String? code) => mapClassesCode.entries.firstWhere((e) => e.value.code == code, orElse: () => MapEntry<String, UserClass>(_unknown.code, _unknown)).value;
}
