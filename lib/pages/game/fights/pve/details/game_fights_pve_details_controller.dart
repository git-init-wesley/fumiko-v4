part of pve_details;

class _GameFightsPveDetailsController extends _GameFightsPveDetailsModel {
  _GameFightsPveDetailsController({required BuildContext context, required EntityMonster monster, required EntityUser user}) {
    _actualMonster = EntityFight(entity: monster);
    _actualUser = EntityFight(entity: user);

    CoreUser.instance.current.addListener((_) => notifyListeners());
    CoreUserPresences.instance.addListener((_) => notifyListeners());

    _streamController = StreamController();
    _streamController!.addStream(Stream.periodic(const Duration(milliseconds: 1), _round));
    _streamSubscription ??= _streamController!.stream.listen(null);
  }

  Future<void> _round(_) async {
    try {
      if (actualRound == 0) {
        if (_actualUser.entity.classes == UserClasses.ninja) {
          monsterFirst = false;
        } else {
          monsterFirst = Random.secure().nextBool();
        }
        actualRound++;
      }

      if (monsterFirst) {
        _roundTargets(target2: _actualUser, target1: _actualMonster);
        _roundTargets(target1: _actualUser, target2: _actualMonster);
      } else {
        _roundTargets(target1: _actualUser, target2: _actualMonster);
        _roundTargets(target2: _actualUser, target1: _actualMonster);
      }

      notifyListeners();

      _addVoidLog();
      actualRound++;
      notifyListeners();

      if (!_checkIfContinue) {
        if (_actualMonster.actualVitality <= 0) {
          //TODO: Recompenses
          num winExp = (_actualMonster.entity.power) / 100;
          winExp *= Random.secure().nextDouble() * 2;

          //TODO: Buff EXP for difficulty classes.

          _createRewardsLog(winExp: winExp);
          _createWinnerLog(entity: _actualUser.entity);
          CoreUser.instance.current.addExp(winExp);
        } else if (_actualUser.actualVitality <= 0) {
          _createWinnerLog(entity: _actualMonster.entity);
        }
        _destroyStream();
      }
    } catch (error, stacktrace) {
      if (!kReleaseMode) {
        developer.log(error.toString(), time: DateTime.now(), stackTrace: stacktrace);
      }
      _destroyStream();
    }
  }

  bool get _checkIfContinue => _actualMonster.actualVitality > 0 && _actualUser.actualVitality > 0;

  void _roundTargets({required EntityFight target1, required EntityFight target2}) {
    if (!_checkIfContinue) return;
    num damage = target1.entity.realStrength;
    bool critical = Random.secure().nextInt(100) >= 95 ? true : false;
    if (critical) damage *= 2;
    target2.actualVitality -= damage;
    _createLog(target1: target1.entity, target2: target2.entity, damage: damage, critical: critical);
  }

  void _createLog({required Entity target1, required Entity target2, required num damage, required bool critical}) {
    logs.add(Row(children: [
      Container(
          margin: const EdgeInsets.only(right: 4),
          child: Text(AppLocalizations.current.rounds(actualRound > 1 ? 's' : '', actualRound), style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))),
      Row(children: [
        Container(margin: const EdgeInsets.only(right: 2), child: Text(target1.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent))),
        Container(margin: const EdgeInsets.only(right: 2), child: Text(AppLocalizations.current.attacks)),
        Container(margin: const EdgeInsets.only(right: 2), child: Text(target2.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent))),
        Container(margin: const EdgeInsets.only(right: 2), child: Text(AppLocalizations.current.andDeals)),
        Container(margin: const EdgeInsets.only(right: 2), child: Text(NumberFormatter.compact(damage), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent))),
        Text('${AppLocalizations.current.damage(damage > 1 ? 's' : '')}.'),
        if (critical)
          Container(
              margin: const EdgeInsets.only(left: 2),
              child: Text(AppLocalizations.current.critical.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent))),
      ])
    ]));
  }

  void _createWinnerLog({required Entity entity}) {
    _addVoidLog();
    logs.add(Row(children: [
      Container(margin: const EdgeInsets.only(right: 2), child: Text(entity.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent))),
      Text('${AppLocalizations.current.winsFight}.'),
    ]));
  }

  void _createRewardsLog({required num winExp}) {
    _addVoidLog();
    logs.add(Row(children: [
      Container(margin: const EdgeInsets.only(right: 2), child: Text(AppLocalizations.current.youHaveWin)),
      Container(margin: const EdgeInsets.only(right: 2), child: Text(NumberFormatter.compact(winExp), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent))),
      Text('${AppLocalizations.current.experiencePoints.toLowerCase()}.'),
    ]));
  }

  void _addVoidLog() {
    logs.add(Container(margin: const EdgeInsets.symmetric(vertical: 8)));
  }

  Future<void> _destroyStream() async {
    await _streamSubscription?.cancel();
    _streamSubscription = null;
    await _streamController?.close();
    _streamController = null;
  }
}
