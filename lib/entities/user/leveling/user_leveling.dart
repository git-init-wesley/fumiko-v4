part of user;

abstract class _EntityUserLeveling {
  void updatePower();

  EntityUserValue<num?> _levels = EntityUserValue<num?>(value: 1);

  num get levels => _levels.value ?? 0;
  StreamSubscription? _levelsObserver;

  EntityUserValue<num?> _rebirths = EntityUserValue<num?>(value: 0);

  num get rebirths => _rebirths.value ?? 0;
  StreamSubscription? _rebirthsObserver;

  EntityUserValue<num?> _exp = EntityUserValue<num?>(value: 0);

  num get exp => _exp.value ?? 0;
  StreamSubscription? _expObserver;

  void _initLevelingValues({required String? uid}) {
    _levels = EntityUserValue<num?>(
      didSet: (num? oldLevels, num? newLevels) async {
        if (oldLevels == newLevels) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          DatabaseUser.of(uid: uid).setLevels(newLevels);
        }
      },
      value: 1,
    );
    _rebirths = EntityUserValue<num?>(
      didSet: (num? oldRebirths, num? newRebirths) async {
        if (oldRebirths == newRebirths) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          DatabaseUser.of(uid: uid).setRebirths(newRebirths);
        }
      },
      value: 0,
    );
    _exp = EntityUserValue<num?>(
      didSet: (num? oldExp, num? newExp) async {
        if (oldExp == newExp) return;
        if (CoreUser.instance.isAuthenticated && CoreUser.instance.isLoaded && uid != null) {
          DatabaseUser.of(uid: uid).setExp(newExp);
        }
      },
      value: 0,
    );
  }

  Future<void> _initLevelingObservers({required String? uid, required Function onChange}) async {
    if (uid == null) return;
    _levelsObserver = await DatabaseUser.of(uid: uid).observeLevels((value) {
      if (value != _levels.value) _levels._set(value ?? 1);
      onChange();
      updatePower();
    });
    _rebirthsObserver = await DatabaseUser.of(uid: uid).observeRebirths((value) {
      if (value != _rebirths.value) _rebirths._set(value ?? 1); //TODO: Make default to 0
      onChange();
      updatePower();
    });
    _expObserver = await DatabaseUser.of(uid: uid).observeExp((value) {
      if (value != _exp.value) _exp._set(value ?? 0);
      onChange();
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

  num get maxExp => pow(levels, 1.1).ceilToDouble() * pow(27.5, 1.2).ceilToDouble() * pow(rebirths + 1, 1.25).ceilToDouble();
}
