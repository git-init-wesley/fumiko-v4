part of pve_details;

class _GameFightsPveDetailsController extends _GameFightsPveDetailsModel {
  _GameFightsPveDetailsController({required BuildContext context, required EntityMonster monster, required EntityUser user}) {
    _actualMonster = monster;
    _actualVitalityMonster = monster.realVitality;
    _actualUser = user;
    _actualVitalityUser = user.realVitality;

    CoreUser.instance.current.addListener((_) => notifyListeners());
    CoreUserPresences.instance.addListener((_) => notifyListeners());

    _streamController = StreamController();
    _streamController!.addStream(Stream.periodic(const Duration(milliseconds: 1), _round));
    _streamSubscription ??= _streamController!.stream.listen(null);
  }

  Future<void> _round(_) async {
    try {
      if (_actualMonster == null || _actualUser == null) return;

      _roundUser();
      _roundMonster();
      notifyListeners();

      _addVoidLog();
      _actualRound++;
      notifyListeners();

      if (!_checkIfContinue) {
        if (_actualVitalityMonster <= 0) {
          _createWinnerLog(entity: _actualUser);
          num winExp = (_actualMonster?.power ?? 0) / 10;
          winExp *= Random().nextDouble() * 2;
          _createRewardsLog(winExp: winExp);
          //TODO: Recompenses
          CoreUser.instance.current.addExp(winExp);
        } else if (_actualVitalityUser <= 0) {
          _createWinnerLog(entity: _actualMonster);
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

  bool get _checkIfContinue => _actualVitalityMonster > 0 && _actualVitalityUser > 0;

  void _roundMonster() {
    if (!_checkIfContinue) return;
    num damage = _actualMonster!.realStrength;
    _actualVitalityUser -= damage;
    _createLog(target1: _actualMonster, target2: _actualUser, damage: damage);
  }

  void _roundUser() {
    if (!_checkIfContinue) return;
    num damage = _actualUser!.realStrength;
    _actualVitalityMonster -= damage;
    _createLog(target1: _actualUser, target2: _actualMonster, damage: damage);
  }

  void _createLog({required Entity? target1, required Entity? target2, required num damage}) {
    logs.add(Row(children: [
      Container(
          margin: const EdgeInsets.only(right: 4),
          child: Text(AppLocalizations.current.rounds(actualRound > 1 ? 's' : '', actualRound), style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))),
      Row(children: [
        Container(margin: const EdgeInsets.only(right: 2), child: Text(target1?.name ?? 'X', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent))),
        Container(margin: const EdgeInsets.only(right: 2), child: Text(AppLocalizations.current.attacks)),
        Container(margin: const EdgeInsets.only(right: 2), child: Text(target2?.name ?? 'Y', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent))),
        Container(margin: const EdgeInsets.only(right: 2), child: Text(AppLocalizations.current.and_deals)),
        Container(margin: const EdgeInsets.only(right: 2), child: Text(NumberFormatter.compact(damage), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent))),
        Text('${AppLocalizations.current.damage(damage > 1 ? 's' : '')}.'),
      ])
    ]));
  }

  void _createWinnerLog({required Entity? entity}) {
    _addVoidLog();
    logs.add(Row(children: [
      Container(margin: const EdgeInsets.only(right: 2), child: Text(entity?.name ?? 'X', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent))),
      Text('${AppLocalizations.current.wins_fight}.'),
    ]));
  }

  void _createRewardsLog({required num winExp}) {
    _addVoidLog();
    logs.add(Row(children: [
      Text('Vous avez gagné '), //TODO: L10n
      Container(margin: const EdgeInsets.only(right: 2), child: Text(NumberFormatter.compact(winExp), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent))),
      Text('points d\'expérience'),
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
