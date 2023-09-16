part of user;

mixin EntityUserStatsPrimary implements EntityStatsPrimary {
  void updatePower();

  void onChange(EntityUserChangeListener obj);

  num get rebirths;

  num get levels;

  EntityClass get classes;

  num get _levelsDelta => ((rebirths * 100 + levels) / 100) + 1;

  EntityUserValue<num?> _strength = EntityUserValue<num?>(value: DefaultEntityUserStatsBase.defaultValue);

  @override
  num get strength => _strength.value ?? 0;

  @override
  num get realStrength => strength * classes.strength * _levelsDelta;

  StreamSubscription? _strengthObserver;

  EntityUserValue<num?> _dexterity = EntityUserValue<num?>(value: DefaultEntityUserStatsBase.defaultValue);

  @override
  num get dexterity => _dexterity.value ?? 0;

  @override
  num get realDexterity => dexterity * classes.dexterity * _levelsDelta;
  StreamSubscription? _dexterityObserver;

  EntityUserValue<num?> _agility = EntityUserValue<num?>(value: DefaultEntityUserStatsBase.defaultValue);

  @override
  num get agility => _agility.value ?? 0;

  @override
  num get realAgility => agility * classes.agility * _levelsDelta;
  StreamSubscription? _agilityObserver;

  EntityUserValue<num?> _vitality = EntityUserValue<num?>(value: DefaultEntityUserStatsBase.defaultValue);

  @override
  num get vitality => _vitality.value ?? 0;

  @override
  num get realVitality => vitality * classes.vitality * _levelsDelta;
  StreamSubscription? _vitalityObserver;

  EntityUserValue<num?> _endurance = EntityUserValue<num?>(value: DefaultEntityUserStatsBase.defaultValue);

  @override
  num get endurance => _endurance.value ?? 0;

  @override
  num get realEndurance => endurance * classes.endurance * _levelsDelta;
  StreamSubscription? _enduranceObserver;

  EntityUserValue<num?> _eyesight = EntityUserValue<num?>(value: DefaultEntityUserStatsBase.defaultValue);

  @override
  num get eyesight => _eyesight.value ?? 0;

  @override
  num get realEyesight => eyesight * classes.eyesight * _levelsDelta;
  StreamSubscription? _eyesightObserver;

  EntityUserValue<num?> _mass = EntityUserValue<num?>(value: DefaultEntityUserStatsBase.defaultValue);

  @override
  num get mass => _mass.value ?? 0;

  @override
  num get realMass => mass * classes.mass * _levelsDelta;
  StreamSubscription? _massObserver;

  Future<void> _getStatsPrimaryValues({required String uid}) async {
    _strength = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getStrength()).value ?? DefaultEntityUserStatsBase.defaultValue);
    _dexterity = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getDexterity()).value ?? DefaultEntityUserStatsBase.defaultValue);
    _agility = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getAgility()).value ?? DefaultEntityUserStatsBase.defaultValue);
    _vitality = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getVitality()).value ?? DefaultEntityUserStatsBase.defaultValue);
    _endurance = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getEndurance()).value ?? DefaultEntityUserStatsBase.defaultValue);
    _eyesight = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getEyesight()).value ?? DefaultEntityUserStatsBase.defaultValue);
    _mass = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getMass()).value ?? DefaultEntityUserStatsBase.defaultValue);
  }

  void _initStatsPrimaryValues({required String? uid}) {
    _strength = EntityUserValue<num?>(
      didSet: (num? oldStrength, num? newStrength) async {
        if (oldStrength == newStrength || newStrength == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setStrength(newStrength));
        }
      },
      value: DefaultEntityUserStatsBase.defaultValue,
    );
    _dexterity = EntityUserValue<num?>(
      didSet: (num? oldDexterity, num? newDexterity) async {
        if (oldDexterity == newDexterity || newDexterity == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setDexterity(newDexterity));
        }
      },
      value: DefaultEntityUserStatsBase.defaultValue,
    );
    _agility = EntityUserValue<num?>(
      didSet: (num? oldAgility, num? newAgility) async {
        if (oldAgility == newAgility || newAgility == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setAgility(newAgility));
        }
      },
      value: DefaultEntityUserStatsBase.defaultValue,
    );
    _vitality = EntityUserValue<num?>(
      didSet: (num? oldVitality, num? newVitality) async {
        if (oldVitality == newVitality || newVitality == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setVitality(newVitality));
        }
      },
      value: DefaultEntityUserStatsBase.defaultValue,
    );
    _endurance = EntityUserValue<num?>(
      didSet: (num? oldEndurance, num? newEndurance) async {
        if (oldEndurance == newEndurance || newEndurance == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setEndurance(newEndurance));
        }
      },
      value: DefaultEntityUserStatsBase.defaultValue,
    );
    _eyesight = EntityUserValue<num?>(
      didSet: (num? oldEyesight, num? newEyesight) async {
        if (oldEyesight == newEyesight || newEyesight == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setEyesight(newEyesight));
        }
      },
      value: DefaultEntityUserStatsBase.defaultValue,
    );
    _mass = EntityUserValue<num?>(
      didSet: (num? oldMass, num? newMass) async {
        if (oldMass == newMass || newMass == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setMass(newMass));
        }
      },
      value: DefaultEntityUserStatsBase.defaultValue,
    );
  }

  Future<void> _initStatsPrimaryObservers({required String? uid, required Function onChange}) async {
    if (uid == null) return;
    _strengthObserver = await DatabaseUser.of(uid: uid).observeStrength((value) async {
      if (value != _strength.value) await _strength._set(value ?? DefaultEntityUserStatsBase.defaultValue);
      onChange(null);
      updatePower();
    });
    _dexterityObserver = await DatabaseUser.of(uid: uid).observeDexterity((value) async {
      if (value != _dexterity.value) await _dexterity._set(value ?? DefaultEntityUserStatsBase.defaultValue);
      onChange(null);
      updatePower();
    });
    _agilityObserver = await DatabaseUser.of(uid: uid).observeAgility((value) async {
      if (value != _agility.value) await _agility._set(value ?? DefaultEntityUserStatsBase.defaultValue);
      onChange(null);
      updatePower();
    });
    _vitalityObserver = await DatabaseUser.of(uid: uid).observeAgility((value) async {
      if (value != _vitality.value) await _vitality._set(value ?? DefaultEntityUserStatsBase.defaultValue);
      onChange(null);
      updatePower();
    });
    _enduranceObserver = await DatabaseUser.of(uid: uid).observeAgility((value) async {
      if (value != _endurance.value) await _endurance._set(value ?? DefaultEntityUserStatsBase.defaultValue);
      onChange(null);
      updatePower();
    });
    _eyesightObserver = await DatabaseUser.of(uid: uid).observeAgility((value) async {
      if (value != _eyesight.value) await _eyesight._set(value ?? DefaultEntityUserStatsBase.defaultValue);
      onChange(null);
      updatePower();
    });
    _massObserver = await DatabaseUser.of(uid: uid).observeAgility((value) async {
      if (value != _mass.value) await _mass._set(value ?? DefaultEntityUserStatsBase.defaultValue);
      onChange(null);
      updatePower();
    });
  }

  Future<void> _destroyStatsPrimaryObservers() async {
    await Database.removeObserver(streamSubscription: _strengthObserver);
    await Database.removeObserver(streamSubscription: _dexterityObserver);
    await Database.removeObserver(streamSubscription: _agilityObserver);
    await Database.removeObserver(streamSubscription: _vitalityObserver);
    await Database.removeObserver(streamSubscription: _enduranceObserver);
    await Database.removeObserver(streamSubscription: _eyesightObserver);
    await Database.removeObserver(streamSubscription: _massObserver);
    _strengthObserver = null;
    _dexterityObserver = null;
    _agilityObserver = null;
    _vitalityObserver = null;
    _enduranceObserver = null;
    _eyesightObserver = null;
    _massObserver = null;
  }
}
