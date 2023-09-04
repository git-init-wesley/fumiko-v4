part of user;

mixin _EntityUserStatsPrimary {
  void updatePower();

  void onChange(UserChangeListener obj);

  UserClass get classes;

  EntityUserValue<num?> _strength = EntityUserValue<num?>(value: DefaultEntityUserStatsBase.defaultValue);

  num get strength => _strength.value ?? 0;

  num get realStrength => strength * classes.strength;
  StreamSubscription? _strengthObserver;

  EntityUserValue<num?> _dexterity = EntityUserValue<num?>(value: DefaultEntityUserStatsBase.defaultValue);

  num get dexterity => _dexterity.value ?? 0;

  num get realDexterity => dexterity * classes.dexterity;
  StreamSubscription? _dexterityObserver;

  Future<void> _getStatsPrimaryValues({required String uid}) async {
    _strength = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getStrength()).value ?? DefaultEntityUserStatsBase.defaultValue);
    _dexterity = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getDexterity()).value ?? DefaultEntityUserStatsBase.defaultValue);
  }

  void _initStatsPrimaryValues({required String? uid}) {
    _strength = EntityUserValue<num?>(
      didSet: (num? oldStrength, num? newStrength) async {
        if (oldStrength == newStrength || newStrength == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setStrength(newStrength));
        }
      },
      value: 1,
    );
    _dexterity = EntityUserValue<num?>(
      didSet: (num? oldDexterity, num? newDexterity) async {
        if (oldDexterity == newDexterity || newDexterity == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setDexterity(newDexterity));
        }
      },
      value: 0,
    );
  }

  Future<void> _initStatsPrimaryObservers({required String? uid, required Function onChange}) async {
    if (uid == null) return;
    _strengthObserver = await DatabaseUser.of(uid: uid).observeStrength((value) {
      if (value != _strength.value) _strength._set(value ?? DefaultEntityUserStatsBase.defaultValue);
      onChange(null);
      updatePower();
    });
    _dexterityObserver = await DatabaseUser.of(uid: uid).observeDexterity((value) {
      if (value != _dexterity.value) _dexterity._set(value ?? DefaultEntityUserStatsBase.defaultValue);
      onChange(null);
      updatePower();
    });
  }

  Future<void> _destroyStatsPrimaryObservers() async {
    await Database.removeObserver(streamSubscription: _strengthObserver);
    await Database.removeObserver(streamSubscription: _dexterityObserver);
    _strengthObserver = null;
    _dexterityObserver = null;
  }
}
