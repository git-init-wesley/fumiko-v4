import 'package:flutter/material.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/pages/game/main/game_main_page.dart';
import 'package:fumiko/widgets/game/buttons/menus_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeMenusButton extends StatelessWidget {
  const HomeMenusButton({super.key, required this.setSubPageRoute});

  final SetSubPageFunction setSubPageRoute;

  @override
  Widget build(BuildContext context) {
    return MenusButton(
      maxWidth: double.infinity,
      color: Colors.black,
      iconData: MdiIcons.home,
      text: AppLocalizations.current.welcome,
      onPressed: () => setSubPageRoute(GameMainSubPages.homeRoute),
    );
  }
}
