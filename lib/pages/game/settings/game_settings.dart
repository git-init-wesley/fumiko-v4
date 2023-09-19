import 'package:flutter/material.dart';
import 'package:fumiko/core/core.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/pages/game/main/game_main_page.dart';
import 'package:fumiko/pages/game/statique/home_menus_button.dart';
import 'package:fumiko/utils/typedefs.dart';
import 'package:fumiko/widgets/game/buttons/menus_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameSettings extends StatelessWidget {
  const GameSettings(
      {super.key, required this.setSubPageRoute, required this.logout});

  final SetSubPageFunction setSubPageRoute;
  final FutureVoidCallback logout;

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
                      onPressed: () => logout.call(),
                      color: Colors.red.shade500,
                      iconData: MdiIcons.logout,
                      text: AppLocalizations.of(context).logout)),
              Text(
                  'Alpha-v${Core.instance.packageInfo?.version ?? '0.0.0'}'), //TODO: Copyright, Versioning...
            ],
          ),
        )
      ],
    );
  }
}
