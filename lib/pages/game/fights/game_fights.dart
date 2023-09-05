import 'package:flutter/material.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/pages/game/main/game_main_page.dart';
import 'package:fumiko/pages/game/statique/home_menus_button.dart';
import 'package:fumiko/widgets/game/buttons/menus_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameFights extends StatelessWidget {
  const GameFights({super.key, required this.setSubPageRoute});

  final SetSubPageFunction setSubPageRoute;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        HomeMenusButton(setSubPageRoute: setSubPageRoute),
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
                    onPressed: () => setSubPageRoute(GameMainSubPages.pvpRoute),
                  )),
              Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: MenusButton(
                    color: Colors.blueAccent,
                    iconData: MdiIcons.controller,
                    text: AppLocalizations.of(context).pve,
                    onPressed: () => setSubPageRoute(GameMainSubPages.pveRoute),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
