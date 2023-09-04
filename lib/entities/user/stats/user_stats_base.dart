part of user;

class DefaultEntityUserStatsBase {
  static const num defaultValue = 10;
  static const num maxStamina = 500;
}

mixin _EntityUserStatsBase {
  void updatePower();

  void onChange(UserChangeListener obj);

  UserClass get classes;

  EntityUserValue<num?> _health = EntityUserValue<num?>(value: DefaultEntityUserStatsBase.defaultValue);

  num get health => _health.value ?? 0;

  num get realHealth => health * classes.vitality;
  StreamSubscription? _healthObserver;

  EntityUserValue<num?> _stamina = EntityUserValue<num?>(value: 500);

  num get stamina => _stamina.value ?? 0;
  StreamSubscription? _staminaObserver;

  Future<void> _getStatsBaseValues({required String uid}) async {
    _health = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getHealth()).value ?? DefaultEntityUserStatsBase.defaultValue);
    _stamina = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getStamina()).value ?? 500);
  }

  void _initStatsBaseValues({required String? uid}) {
    _health = EntityUserValue<num?>(
      didSet: (num? oldHealth, num? newHealth) async {
        if (oldHealth == newHealth || newHealth == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setHealth(newHealth));
        }
      },
      value: 1,
    );
    _stamina = EntityUserValue<num?>(
      didSet: (num? oldStamina, num? newStamina) async {
        if (oldStamina == newStamina || newStamina == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setStamina(newStamina));
        }
      },
      value: 0,
    );
  }

  Future<void> _initStatsBaseObservers({required String? uid, required Function onChange}) async {
    if (uid == null) return;
    _healthObserver = await DatabaseUser.of(uid: uid).observeHealth((value) {
      if (value != _health.value) _health._set(value ?? DefaultEntityUserStatsBase.defaultValue);
      onChange(null);
      updatePower();
    });
    _staminaObserver = await DatabaseUser.of(uid: uid).observeStamina((value) {
      if (value != _stamina.value) _stamina._set(value ?? 500);
      onChange(null);
      updatePower();
    });
  }

  Future<void> _destroyStatsBaseObservers() async {
    await Database.removeObserver(streamSubscription: _healthObserver);
    await Database.removeObserver(streamSubscription: _staminaObserver);
    _healthObserver = null;
    _staminaObserver = null;
  }
}
