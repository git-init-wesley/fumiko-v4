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
    _streamController!.addStream(Stream.periodic(const Duration(seconds: 1), _round));
    _streamSubscription ??= _streamController!.stream.listen(null);
  }

  Future<void> _round(_) async {
    try {
      if (_actualMonster == null || _actualUser == null) return;

      _roundUser();
      _roundMonster();

      if (!_checkIfContinue) {
        _destroyStream();
      }

      _actualRound++;
      notifyListeners();
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
    _actualVitalityUser = _actualVitalityUser - (_actualMonster!.realStrength);

    _createLog(_actualMonster!, _actualUser!);
    _createLog(_actualUser!, _actualMonster!);
  }

  void _roundUser() {
    if (!_checkIfContinue) return;
    _actualVitalityMonster = _actualVitalityMonster - (_actualUser!.realStrength);
  }

  Widget _createLog(Entity target1, Entity target2) {
    return Row(children: [
      Row(children: [
        Text(target1.name),
      ])
    ]);
  }

  Future<void> _destroyStream() async {
    await _streamSubscription?.cancel();
    _streamSubscription = null;
    await _streamController?.close();
    _streamController = null;
  }
}
