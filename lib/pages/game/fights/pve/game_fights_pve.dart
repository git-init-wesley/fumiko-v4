import 'package:flutter/material.dart';
import 'package:fumiko/core/user/core_user.dart';
import 'package:fumiko/entities/monster/classes/monster_classes.dart';
import 'package:fumiko/entities/monster/monster.dart';
import 'package:fumiko/pages/game/fights/pve/details/game_fights_pve_details_page.dart';
import 'package:fumiko/pages/game/main/game_main_page.dart';
import 'package:fumiko/pages/game/statique/home_menus_button.dart';
import 'package:fumiko/utils/win_rate.dart';
import 'package:fumiko/widgets/game/buttons/pve_monster_button.dart';

class GameFightsPve extends StatelessWidget {
  const GameFightsPve({super.key, required this.setSubPageRoute, required this.setAbstractWidget});

  final SetSubPageFunction setSubPageRoute;
  final SetAbstractWidgetFunction setAbstractWidget;

  void _generateFightDetails({required EntityMonster monster}) {
    setAbstractWidget(GameFightsPveDetailsPage(
        monster: monster,
        user: CoreUser.instance.current,
        setSubPageRoute: setSubPageRoute,
        repeat: () => _generateFightDetails(monster: EntityMonster.of(levels: monster.levels, isBoss: monster.isBoss, classes: monster.classes, rebirths: 0))));
  }

  List<Widget> _generateMonsters() {
    List<Widget> monsters = [];

    const num minLevel = 1, maxLevel = 10;
    final MonsterClass classes = MonsterClasses.alpha;

    for (num i = minLevel; i <= maxLevel; i++) {
      final bool isBoss = i % 5 == 0;
      final EntityMonster monster = EntityMonster.of(levels: i, isBoss: isBoss, classes: classes, rebirths: 0);
      monsters.add(Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: PveMonsterButton(
          isBoss: isBoss,
          levels: i,
          title: 'Monster',
          power: monster.power,
          classes: monster.classes,
          winRate: WinRate.ofPvE(monster: monster, user: CoreUser.instance.current),
          onPressed: () {
            _generateFightDetails(monster: monster);
          },
          setSubPageRoute: setSubPageRoute,
        ),
      ));
    }

    return monsters;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
      HomeMenusButton(setSubPageRoute: setSubPageRoute),
      Container(
        constraints: const BoxConstraints(maxWidth: 384),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        margin: const EdgeInsets.only(top: 4),
        child: Text('Vous êtes présentement dans la ville de GenOne se situant dans le pays de Alpha.', textAlign: TextAlign.center),
      ),
      Container(
        constraints: const BoxConstraints(maxWidth: 384),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        margin: const EdgeInsets.only(top: 4),
        child: Text('Vous êtes à l\'heure actuelle X aventuriers dans cette ville avec un total de X aventuriers dans le pays.', textAlign: TextAlign.center),
      ),
      Container(margin: const EdgeInsets.only(top: 16), padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8), child: ListBody(children: _generateMonsters())),
    ]);
  }
}
