part of pve_details;

class _GameFightsPveDetailsModel extends PageBaseModel {
  StreamController? _streamController;
  StreamSubscription? _streamSubscription;

  EntityMonster? _actualMonster;
  num _actualVitalityMonster = 0;

  num get actualVitalityMonster => _actualVitalityMonster;

  EntityUser? _actualUser;
  num _actualVitalityUser = 0;

  num get actualVitalityUser => _actualVitalityUser;

  num _actualRound = 0;

  num get actualRound => _actualRound;

  bool _monsterFirst = false;

  bool get monsterFirst => _monsterFirst ?? false;

  List<Widget> logs = [];
}
