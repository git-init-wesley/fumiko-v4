import 'package:flutter/material.dart';
import 'package:fumiko/widgets/game/buttons/menus_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameFights extends StatelessWidget {
  const GameFights({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MenusButton(
        color: Colors.black,
        iconData: MdiIcons.home,
        text: 'Accueil',
        onPressed: () => pageController.animateToPage(0, duration: const Duration(microseconds: 1), curve: Curves.linear),
      ),
    );
  }
}
