import 'package:fumiko/entities/entity/classes/entity_classes.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/utils/assets/assets_images.dart';

class UserClass with EntityClass {
  final String _code;

  @override
  String get code => _code;

  final String _name;

  @override
  String get name => _name;

  final AssetsImage _icon;

  @override
  AssetsImage get icon => _icon;

  final AssetsImage _graphics;

  @override
  AssetsImage get graphics => _graphics;

  final String _description;

  @override
  String get description => _description;

  final num _strength;

  @override
  num get strength => _strength;

  final num _dexterity;

  @override
  num get dexterity => _dexterity;

  final num _agility;

  @override
  num get agility => _agility;

  final num _vitality;

  @override
  num get vitality => _vitality;

  final num _endurance;

  @override
  num get endurance => _endurance;

  final num _eyesight;

  @override
  num get eyesight => _eyesight;

  final num _mass;

  @override
  num get mass => _mass;

  UserClass({
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
        _icon = icon,
        _graphics = graphic,
        _description = description,
        _strength = strength,
        _dexterity = dexterity,
        _agility = agility,
        _vitality = vitality,
        _endurance = endurance,
        _eyesight = eyesight,
        _mass = mass;
}

class UserClasses {
  UserClasses._();

  static final UserClass mage = UserClass(
    code: 'mage',
    name: AppLocalizations.current.mage,
    icon: AssetsImages.mageIcon,
    graphic: AssetsImages.mageGraphic,
    description: AppLocalizations.current.mageDescription,
    strength: 1,
    dexterity: 1.1,
    agility: 0.7,
    vitality: 1.1,
    endurance: 1.1,
    eyesight: 1,
    mass: 1,
  );

  static final UserClass warrior = UserClass(
    code: 'warrior',
    name: AppLocalizations.current.warrior,
    icon: AssetsImages.warriorIcon,
    graphic: AssetsImages.warriorGraphic,
    description: AppLocalizations.current.warriorDescription,
    strength: 1.5,
    dexterity: 0.8,
    agility: 0.7,
    vitality: 1.5,
    endurance: 0.5,
    eyesight: 0.5,
    mass: 1.5,
  );

  static final UserClass ninja = UserClass(
    code: 'ninja',
    name: AppLocalizations.current.ninja,
    icon: AssetsImages.ninjaIcon,
    graphic: AssetsImages.ninjaGraphic,
    description: AppLocalizations.current.ninjaDescription,
    strength: 0.5,
    dexterity: 1.1,
    agility: 1.6,
    vitality: 0.4,
    endurance: 1.4,
    eyesight: 1.5,
    mass: 0.5,
  );

  static final List<UserClass> _classes = [mage, warrior, ninja];

  static final UserClass _unknown = UserClass(
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

  static UserClass get unknown => _unknown;

  static List<UserClass> get classes => _classes;

  static List<String> get classesCode => classes.map((e) => e.code).toList();

  static Map<String, UserClass> get mapClassesCode => Map.fromIterables(classesCode, classes);

  static UserClass fromCode(String? code) => mapClassesCode.entries.firstWhere((e) => e.value.code == code, orElse: () => MapEntry<String, UserClass>(_unknown.code, _unknown)).value;
}
