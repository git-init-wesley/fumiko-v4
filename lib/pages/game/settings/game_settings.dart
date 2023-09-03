import 'package:flutter/material.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/pages/game/statique/home_menus_button.dart';
import 'package:fumiko/widgets/game/buttons/menus_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameSettings extends StatelessWidget {
  const GameSettings({super.key, required this.pageController, required this.logout});

  final PageController pageController;
  final VoidCallback logout;

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
                    margin: const EdgeInsets.only(bottom: 8), child: MenusButton(onPressed: logout, color: Colors.red.shade500, iconData: MdiIcons.logout, text: AppLocalizations.of(context).logout)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
