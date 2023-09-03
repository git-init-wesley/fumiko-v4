part of user;

mixin _EntityUserBalance {
  void updatePower();

  void onChange(UserChangeListener obj);

  EntityUserValue<num?> _primary = EntityUserValue<num?>(value: 0);

  num get primary => _primary.value ?? 0;
  StreamSubscription? _primaryObserver;

  EntityUserValue<num?> _secondary = EntityUserValue<num?>(value: 0);

  num get secondary => _secondary.value ?? 0;
  StreamSubscription? _secondaryObserver;

  EntityUserValue<num?> _trophies = EntityUserValue<num?>(value: 0);

  num get trophies => _trophies.value ?? 0;
  StreamSubscription? _trophiesObserver;

  Future<void> _getBalanceValues({required String uid}) async {
    _primary = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getPrimary()).value ?? 0);
    _secondary = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getSecondary()).value ?? 0);
    _trophies = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getTrophies()).value ?? 0);
  }

  void _initBalanceValues({required String? uid}) {
    _primary = EntityUserValue<num?>(
      didSet: (num? oldPrimary, num? newPrimary) async {
        if (oldPrimary == newPrimary) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setPrimary(newPrimary));
        }
      },
      value: 0,
    );
    _secondary = EntityUserValue<num?>(
      didSet: (num? oldSecondary, num? newSecondary) async {
        if (oldSecondary == newSecondary) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setSecondary(newSecondary));
        }
      },
      value: 0,
    );
    _trophies = EntityUserValue<num?>(
      didSet: (num? oldTrophies, num? newTrophies) async {
        if (oldTrophies == newTrophies) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setTrophies(newTrophies));
        }
      },
      value: 0,
    );
  }

  Future<void> _initBalanceObservers({required String? uid, required Function onChange}) async {
    if (uid == null) return;
    _primaryObserver = await DatabaseUser.of(uid: uid).observePrimary((value) {
      if (value != _primary.value) _primary._set(value ?? 0);
      onChange(null);
      updatePower();
    });
    _secondaryObserver = await DatabaseUser.of(uid: uid).observeSecondary((value) {
      if (value != _secondary.value) _secondary._set(value ?? 0);
      onChange(null);
      updatePower();
    });
    _trophiesObserver = await DatabaseUser.of(uid: uid).observeTrophies((value) {
      if (value != _trophies.value) _trophies._set(value ?? 0);
      onChange(null);
      updatePower();
    });
  }

  Future<void> _destroyBalanceObservers() async {
    await Database.removeObserver(streamSubscription: _primaryObserver);
    await Database.removeObserver(streamSubscription: _secondaryObserver);
    await Database.removeObserver(streamSubscription: _trophiesObserver);
    _primaryObserver = null;
    _secondaryObserver = null;
    _trophiesObserver = null;
  }
}
