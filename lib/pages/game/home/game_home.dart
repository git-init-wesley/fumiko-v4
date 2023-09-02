import 'package:flutter/material.dart';
import 'package:fumiko/widgets/game/buttons/menus_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameHome extends StatelessWidget {
  const GameHome({super.key, required this.pageController, required this.fightsPage, required this.settingsPage});

  final PageController pageController;
  final int fightsPage;
  final int settingsPage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(children: [
        Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: MenusButton(
              height: 56,
              maxWidth: 384,
              color: Colors.redAccent,
              iconData: MdiIcons.sword,
              text: 'Combats',
              textSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
              onPressed: () => pageController.animateToPage(fightsPage, duration: const Duration(microseconds: 1), curve: Curves.linear),
            )),
        Container(margin: const EdgeInsets.only(bottom: 8), child: MenusButton(color: Colors.tealAccent.shade100, iconData: MdiIcons.sack, text: 'Inventaire')),
        Container(margin: const EdgeInsets.only(bottom: 8), child: MenusButton(color: Colors.deepPurpleAccent.shade100, iconData: MdiIcons.scriptText, text: 'Quêtes')),
        Container(margin: const EdgeInsets.only(bottom: 8), child: MenusButton(color: Colors.deepOrangeAccent.shade100, iconData: MdiIcons.map, text: 'Carte')),
        Container(margin: const EdgeInsets.only(bottom: 8), child: MenusButton(color: Colors.pinkAccent.shade100, iconData: MdiIcons.shield, text: 'Alliance')),
        Container(margin: const EdgeInsets.only(bottom: 8), child: MenusButton(color: Colors.yellowAccent.shade100, iconData: MdiIcons.shopping, text: 'Boutique')),
        Container(margin: const EdgeInsets.only(bottom: 8), child: MenusButton(color: Colors.orange.shade100, iconData: MdiIcons.treasureChest, text: 'Coffres')),
        MenusButton(
          color: Colors.black,
          iconData: MdiIcons.cog,
          text: 'Paramètres',
          onPressed: () => pageController.animateToPage(settingsPage, duration: const Duration(microseconds: 1), curve: Curves.linear),
        )
      ]),
    ));
  }
}
