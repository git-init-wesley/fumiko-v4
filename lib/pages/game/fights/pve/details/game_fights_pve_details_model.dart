part of pve_details;

class _GameFightsPveDetailsModel extends PageBaseModel {
  StreamController? _streamController;
  StreamSubscription? _streamSubscription;

  late EntityFight _actualMonster;

  late EntityFight _actualUser;

  num _actualRound = 0;

  num get actualRound => _actualRound;

  set actualRound(v) => _actualRound = v;

  bool _monsterFirst = false;

  bool get monsterFirst => _monsterFirst;

  set monsterFirst(v) => _monsterFirst = v;

  List<Widget> logs = [];
}
