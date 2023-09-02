import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fumiko/utils/number_formatter.dart';
import 'package:fumiko/widgets/game/small_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameSubheader extends StatelessWidget {
  const GameSubheader({super.key, required this.primary, required this.secondary, required this.power});

  final num primary, secondary, power;

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    double indicatorWidth = mediaWidth * 0.90 / 3;
    if (mediaWidth > 1024) {
      indicatorWidth = mediaWidth * 0.90 / 6;
    } else if (indicatorWidth * 1.1 * 3 > 512) {
      indicatorWidth = 512 * 0.9 / 3;
    }
    final List<Widget> children = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SmallIndicator(
            backgroundColor: Colors.black,
            text: '0',
            //TODO: Stamina
            iconData: FontAwesomeIcons.bolt,
            iconColor: Colors.purpleAccent,
            onPressed: () {},
            withIconData: FontAwesomeIcons.plus,
            width: indicatorWidth,
          ),
          SmallIndicator(
            backgroundColor: Colors.black,
            text: NumberFormatter.compact(primary),
            //TODO: Balance
            iconData: FontAwesomeIcons.coins,
            iconColor: Colors.white70,
            onPressed: () {},
            withIconData: FontAwesomeIcons.plus,
            width: indicatorWidth,
          ),
          SmallIndicator(
            backgroundColor: Colors.black,
            text: NumberFormatter.compact(secondary),
            //TODO: Balance
            iconData: FontAwesomeIcons.solidGem,
            iconColor: Colors.blueAccent,
            onPressed: () {},
            withIconData: FontAwesomeIcons.plus,
            width: indicatorWidth,
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.only(top: mediaWidth > 1024 ? 0 : 8, left: mediaWidth > 1024 ? 8 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SmallIndicator(
              backgroundColor: Colors.black,
              text: NumberFormatter.compact(power),
              //TODO: Power
              iconData: MdiIcons.swordCross,
              iconColor: Colors.redAccent,
              onPressed: () {},
              withIconData: FontAwesomeIcons.info,
              width: indicatorWidth,
            ),
            SmallIndicator(
              backgroundColor: Colors.black,
              text: '0',
              //TODO: Classement
              iconData: FontAwesomeIcons.trophy,
              iconColor: Colors.orangeAccent,
              onPressed: () {},
              withIconData: FontAwesomeIcons.info,
              width: indicatorWidth,
            ),
            SmallIndicator(
              backgroundColor: Colors.black,
              text: NumberFormatter.compact(0),
              //TODO: Presence
              iconData: FontAwesomeIcons.users,
              iconColor: Colors.white,
              onPressed: () {},
              withIconData: FontAwesomeIcons.info,
              width: indicatorWidth,
            ),
          ],
        ),
      ),
    ];
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxWidth: mediaWidth > 1024 ? double.infinity : 512),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.only(top: 8),
      child: mediaWidth > 1024
          ? Row(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: children)
          : Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: children),
    );
  }
}
