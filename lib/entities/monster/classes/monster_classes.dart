import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/utils/assets/assets_images.dart';

class MonsterClass {
  final String _code;

  String get code => _code;

  final String _name;

  String get name => _name;

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

  MonsterClass({
    required String code,
    required String name,
    required AssetsImage icon,
    required AssetsImage graphic,
    required String description,
    required num strength,
    required num dexterity,
    required num agility,
    required num vitality,
    required num endurance,
    required num eyesight,
    required num mass,
  })  : _code = code,
        _name = name,
        _image = icon,
        _graphics = graphic,
        _description = description,
        _strength = strength,
        _dexterity = dexterity,
        _agility = agility,
        _vitality = vitality,
        _endurance = endurance,
        _eyesight = eyesight,
        _mass = mass;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MonsterClass && runtimeType == other.runtimeType && _code == other._code;

  @override
  int get hashCode => _code.hashCode;

  @override
  String toString() {
    return 'MonsterClass{_code: $_code, _name: $_name, _image: $_image, _graphics: $_graphics, _description: $_description, _strength: $_strength, _dexterity: $_dexterity, _agility: $_agility, _vitality: $_vitality, _endurance: $_endurance, _eyesight: $_eyesight, _mass: $_mass}';
  }
}

class MonsterClasses {
  MonsterClasses._();

  static final List<MonsterClass> _classes = [
    MonsterClass(
      code: 'alpha',
      name: 'Monster',
      icon: AssetsImages.fumikoIcon,
      graphic: AssetsImages.fumikoGraphic,
      description: AppLocalizations.current.mageDescription,
      strength: 0.5,
      dexterity: 0.5,
      agility: 0.5,
      vitality: 0.5,
      endurance: 0.5,
      eyesight: 0.5,
      mass: 0.5,
    ),
  ];

  static final MonsterClass _unknown = MonsterClass(
    code: 'unknown',
    name: 'unknown',
    icon: AssetsImages.fumikoIcon,
    graphic: AssetsImages.fumikoGraphic,
    description: 'N/A',
    strength: 0,
    dexterity: 0,
    agility: 0,
    vitality: 0,
    endurance: 0,
    eyesight: 0,
    mass: 0,
  );

  static MonsterClass get unknown => _unknown;

  static List<MonsterClass> get classes => _classes;

  static List<String> get classesCode => classes.map((e) => e.code).toList();

  static Map<String, MonsterClass> get mapClassesCode => Map.fromIterables(classesCode, classes);

  static MonsterClass fromCode(String? code) => mapClassesCode.entries.firstWhere((e) => e.value.code == code, orElse: () => MapEntry<String, MonsterClass>(_unknown.code, _unknown)).value;
}
