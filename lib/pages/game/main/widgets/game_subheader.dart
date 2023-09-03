import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fumiko/utils/number_formatter.dart';
import 'package:fumiko/widgets/game/indicators/small_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameSubheader extends StatelessWidget {
  const GameSubheader(
      {super.key,
      required this.primary,
      required this.secondary,
      required this.power,
      required this.pageController,
      required this.trophies,
      required this.shopPrimaryPage,
      required this.shopSecondaryPage,
      required this.statsPage,
      required this.rankingsPage,
      required this.presencesPage,
      required this.onlineUsers});

  final PageController pageController;
  final num primary, secondary, power, trophies, onlineUsers;
  final int shopPrimaryPage, shopSecondaryPage, statsPage, rankingsPage, presencesPage;

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
            onPressed: null,
            withIconData: FontAwesomeIcons.plus,
            width: indicatorWidth,
          ),
          SmallIndicator(
            backgroundColor: Colors.black,
            text: NumberFormatter.compact(primary),
            iconData: FontAwesomeIcons.coins,
            iconColor: Colors.white70,
            onPressed: () => pageController.animateToPage(shopPrimaryPage, duration: const Duration(microseconds: 1), curve: Curves.linear),
            withIconData: FontAwesomeIcons.plus,
            width: indicatorWidth,
          ),
          SmallIndicator(
            backgroundColor: Colors.black,
            text: NumberFormatter.compact(secondary),
            iconData: FontAwesomeIcons.solidGem,
            iconColor: Colors.blueAccent,
            onPressed: () => pageController.animateToPage(shopSecondaryPage, duration: const Duration(microseconds: 1), curve: Curves.linear),
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
              iconData: MdiIcons.swordCross,
              iconColor: Colors.redAccent,
              onPressed: () => pageController.animateToPage(statsPage, duration: const Duration(microseconds: 1), curve: Curves.linear),
              withIconData: FontAwesomeIcons.info,
              width: indicatorWidth,
            ),
            SmallIndicator(
              backgroundColor: Colors.black,
              text: NumberFormatter.compact(trophies),
              iconData: FontAwesomeIcons.trophy,
              iconColor: Colors.orangeAccent,
              onPressed: () => pageController.animateToPage(rankingsPage, duration: const Duration(microseconds: 1), curve: Curves.linear),
              withIconData: FontAwesomeIcons.info,
              width: indicatorWidth,
            ),
            SmallIndicator(
              backgroundColor: Colors.black,
              text: NumberFormatter.compact(onlineUsers),
              iconData: FontAwesomeIcons.users,
              iconColor: Colors.white,
              onPressed: () => pageController.animateToPage(presencesPage, duration: const Duration(microseconds: 1), curve: Curves.linear),
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
