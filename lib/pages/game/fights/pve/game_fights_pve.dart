import 'package:flutter/material.dart';
import 'package:fumiko/pages/game/main/game_main_page.dart';
import 'package:fumiko/pages/game/statique/home_menus_button.dart';

class GameFightsPvE extends StatelessWidget {
  const GameFightsPvE({super.key, required this.setSubPageRoute});

  final SetSubPageFunction setSubPageRoute;

  /// @version 1.0.0
  List<Widget> _generateMonsters() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      HomeMenusButton(setSubPageRoute: setSubPageRoute),
      Container(
        constraints: const BoxConstraints(maxWidth: 384),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        margin: const EdgeInsets.only(top: 4),
        child: Text('Vous êtes présentement dans la ville de GenOne se situant dans le pays de Alpha.'),
      ),
      Container(
        constraints: const BoxConstraints(maxWidth: 384),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        margin: const EdgeInsets.only(top: 4),
        child: Text('Vous êtes à l\'heure actuelle X aventuriers dans cette ville avec un total de X aventuriers dans le pays.'),
      ),
      Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: ListBody(
          children: _generateMonsters(),
        ),
      )
    ]);
  }
}
