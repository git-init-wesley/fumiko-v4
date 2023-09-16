part of user;

mixin EntityUserLeveling {
  void updatePower();

  void onChange(EntityUserChangeListener obj);

  EntityUserValue<num?> _levels = EntityUserValue<num?>(value: 1);

  num get levels => _levels.value ?? 0;
  StreamSubscription? _levelsObserver;

  EntityUserValue<num?> _rebirths = EntityUserValue<num?>(value: 0);

  num get rebirths => _rebirths.value ?? 0;
  StreamSubscription? _rebirthsObserver;

  EntityUserValue<num?> _exp = EntityUserValue<num?>(value: 0);

  num get exp => _exp.value ?? 0;
  StreamSubscription? _expObserver;

  Future<void> _getLevelingValues({required String uid}) async {
    _levels = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getLevels()).value ?? 1);
    _rebirths = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getRebirths()).value ?? 0);
    _exp = EntityUserValue<num?>(value: (await DatabaseUser.of(uid: uid).getExp()).value ?? 0);
  }

  void _initLevelingValues({required String? uid}) {
    _levels = EntityUserValue<num?>(
      didSet: (num? oldLevels, num? newLevels) async {
        if (oldLevels == newLevels || newLevels == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setLevels(newLevels));
        }
      },
      value: 1,
    );
    _rebirths = EntityUserValue<num?>(
      didSet: (num? oldRebirths, num? newRebirths) async {
        if (oldRebirths == newRebirths || newRebirths == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setRebirths(newRebirths));
        }
      },
      value: 0,
    );
    _exp = EntityUserValue<num?>(
      didSet: (num? oldExp, num? newExp) async {
        if (oldExp == newExp || newExp == null) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          onChange(await DatabaseUser.of(uid: uid).setExp(newExp));
        }
      },
      value: 0,
    );
  }

  Future<void> _initLevelingObservers({required String? uid, required Function onChange}) async {
    if (uid == null) return;
    _levelsObserver = await DatabaseUser.of(uid: uid).observeLevels((value) async {
      if (value != _levels.value) await _levels._set(value ?? 1);
      onChange(null);
      updatePower();
    });
    _rebirthsObserver = await DatabaseUser.of(uid: uid).observeRebirths((value) async {
      if (value != _rebirths.value) await _rebirths._set(value ?? 0);
      onChange(null);
      updatePower();
    });
    _expObserver = await DatabaseUser.of(uid: uid).observeExp((value) async {
      if (value != _exp.value) await _exp._set(value ?? 0);
      onChange(null);
      updatePower();
    });
  }

  Future<void> _destroyLevelingObservers() async {
    await Database.removeObserver(streamSubscription: _levelsObserver);
    await Database.removeObserver(streamSubscription: _rebirthsObserver);
    await Database.removeObserver(streamSubscription: _expObserver);
    _levelsObserver = null;
    _rebirthsObserver = null;
    _expObserver = null;
  }

  Future<void> addExp(num amounts) async {
    await _exp._set(exp + amounts);
    while (exp >= maxExp) {
      await _exp._set(exp - maxExp);
      await _levels._set(levels + 1);
      while (levels > 100) {
        await _levels._set(levels - 100);
        await _rebirths._set(rebirths + 1);
      }
    }
  }

  num get maxExp => (pow(levels, 1.1) * pow(27.5, 1.2) * pow(rebirths + 1, 1.25)).ceilToDouble();
}
