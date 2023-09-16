part of user;

class DefaultEntityUserStatsBase {
  static const num defaultValue = 100;
  static const num maxStamina = 500;
}

mixin EntityUserStatsBase {
  void updatePower();

  void onChange(EntityUserChangeListener obj);

  UserClass get classes;

  EntityUserValue<num?> _stamina = EntityUserValue<num?>(value: 500);

  num get stamina => _stamina.value ?? 0;
  StreamSubscription? _staminaObserver;

  Future<void> _getStatsBaseValues({required String uid}) async {
    _stamina = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getStamina()).value ?? 500);
  }

  void _initStatsBaseValues({required String? uid}) {
    _stamina = EntityUserValue<num?>(
      didSet: (num? oldStamina, num? newStamina) async {
        if (oldStamina == newStamina || newStamina == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setStamina(newStamina));
        }
      },
      value: 500,
    );
  }

  Future<void> _initStatsBaseObservers({required String? uid, required Function onChange}) async {
    if (uid == null) return;
    _staminaObserver = await DatabaseUser.of(uid: uid).observeStamina((value) async {
      if (value != _stamina.value) await _stamina._set(value ?? 500);
      onChange(null);
      updatePower();
    });
  }

  Future<void> _destroyStatsBaseObservers() async {
    await Database.removeObserver(streamSubscription: _staminaObserver);
    _staminaObserver = null;
  }
}
