import 'package:flutter/material.dart';
import 'package:fumiko/core/user/core_user.dart';
import 'package:fumiko/entities/monster/classes/monster_classes.dart';
import 'package:fumiko/entities/monster/monster.dart';
import 'package:fumiko/pages/game/fights/pve/details/game_fights_pve_details_page.dart';
import 'package:fumiko/pages/game/main/game_main_page.dart';
import 'package:fumiko/utils/number_formatter.dart';
import 'package:fumiko/utils/win_rate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PveMonsterButton extends StatelessWidget {
  const PveMonsterButton(
      {super.key,
      required this.isBoss,
      required this.levels,
      required this.title,
      required this.winRate,
      required this.power,
      required this.setAbstractWidget,
      required this.classes,
      required this.setSubPageRoute});

  final SetAbstractWidgetFunction setAbstractWidget;
  final SetSubPageFunction setSubPageRoute;
  final WinRate winRate;
  final String title;
  final MonsterClass classes;
  final bool isBoss;
  final num levels, power;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(Size(0, isBoss ? 64 : 48)),
            backgroundColor: MaterialStateProperty.all<Color>(isBoss ? Colors.redAccent.withOpacity(0.75) : Colors.transparent),
            overlayColor: MaterialStateProperty.all<Color>(isBoss ? Colors.redAccent.withOpacity(0.6) : Colors.transparent.withOpacity(0.6)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.black),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)))),
        onPressed: () {
          setAbstractWidget(GameFightsPveDetailsPage(monster: EntityMonster.of(levels: levels, isBoss: isBoss, classes: classes), user: CoreUser.instance.current, setSubPageRoute: setSubPageRoute));
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(isBoss ? MdiIcons.swordCross : MdiIcons.sword, size: Theme.of(context).textTheme.titleLarge?.fontSize),
          Container(
              margin: const EdgeInsets.only(left: 4),
              child: Row(
                children: [
                  Text('${title.toUpperCase()} Lv.$levels', style: TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleLarge?.fontSize)),
                  Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: Text('(Power: ${NumberFormatter.compact(power)})',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleLarge?.fontSize, color: winRate.color()))),
                ],
              ))
        ]));
  }
}
