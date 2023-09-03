import 'package:flutter/material.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/pages/game/statique/home_menus_button.dart';
import 'package:fumiko/widgets/game/buttons/menus_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameFights extends StatelessWidget {
  const GameFights({super.key, required this.pageController, required this.pvpPage, required this.pvePage});

  final PageController pageController;
  final int pvpPage, pvePage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          HomeMenusButton(pageController: pageController),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: MenusButton(
                      color: Colors.redAccent.withOpacity(0.5),
                      iconData: MdiIcons.controllerOff,
                      text: AppLocalizations.of(context).pvp,
                      // onPressed: () => pageController.animateToPage(pvpPage, duration: const Duration(microseconds: 1), curve: Curves.linear),
                    )),
                Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: MenusButton(
                      color: Colors.blueAccent,
                      iconData: MdiIcons.controller,
                      text: AppLocalizations.of(context).pve,
                      onPressed: () => pageController.animateToPage(pvePage, duration: const Duration(microseconds: 1), curve: Curves.linear),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
