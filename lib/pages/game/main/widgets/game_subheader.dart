import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fumiko/utils/number_formatter.dart';
import 'package:fumiko/widgets/game/small_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameSubheader extends StatelessWidget {
  const GameSubheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.only(top: 8),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallIndicator(
              backgroundColor: Colors.black,
              text: '0',
              //TODO: Stamina
              iconData: FontAwesomeIcons.bolt,
              iconColor: Colors.purpleAccent,
              onPressed: null,
              withIconData: FontAwesomeIcons.plus,
            ),
            SmallIndicator(
              backgroundColor: Colors.black,
              text: NumberFormatter.compact(0),
              //TODO: Balance
              iconData: FontAwesomeIcons.coins,
              iconColor: Colors.white70,
              onPressed: () {},
              withIconData: FontAwesomeIcons.plus,
            ),
            SmallIndicator(
              backgroundColor: Colors.black,
              text: NumberFormatter.compact(0),
              //TODO: Balance
              iconData: FontAwesomeIcons.solidGem,
              iconColor: Colors.blueAccent,
              onPressed: () {},
              withIconData: FontAwesomeIcons.plus,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SmallIndicator(
              backgroundColor: Colors.black,
              text: NumberFormatter.compact(1000),
              //TODO: Power
              iconData: MdiIcons.swordCross,
              iconColor: Colors.redAccent,
              onPressed: () {},
              withIconData: FontAwesomeIcons.info,
            ),
            SmallIndicator(
              backgroundColor: Colors.black,
              text: '0',
              //TODO: Classement
              iconData: FontAwesomeIcons.trophy,
              iconColor: Colors.orangeAccent,
              onPressed: () {},
              withIconData: FontAwesomeIcons.info,
            ),
            SmallIndicator(
              backgroundColor: Colors.black,
              text: NumberFormatter.compact(0),
              //TODO: Presence
              iconData: FontAwesomeIcons.users,
              iconColor: Colors.white,
              onPressed: () {},
              withIconData: FontAwesomeIcons.info,
            ),
          ]),
        ),
      ]),
    );
  }
}
