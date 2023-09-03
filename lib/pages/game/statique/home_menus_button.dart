import 'package:flutter/material.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/widgets/game/buttons/menus_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeMenusButton extends StatelessWidget {
  const HomeMenusButton({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return MenusButton(
      maxWidth: double.infinity,
      color: Colors.black,
      iconData: MdiIcons.home,
      text: AppLocalizations.current.welcome,
      onPressed: () => pageController.animateToPage(0, duration: const Duration(microseconds: 1), curve: Curves.linear),
    );
  }
}
