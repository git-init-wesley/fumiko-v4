import 'package:flutter/material.dart';
import 'package:fumiko/entities/user/user.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/pages/game/main/game_main_page.dart';
import 'package:fumiko/pages/game/statique/home_menus_button.dart';

class GameUsers extends StatefulWidget {
  const GameUsers({super.key, required this.userPresences, required this.setSubPageRoute, required this.onChange});

  final VoidCallback onChange;
  final List<UserPresences> userPresences;
  final SetSubPageFunction setSubPageRoute;

  @override
  State<GameUsers> createState() => _GameUsersState();
}

class _GameUsersState extends State<GameUsers> {
  late List<EntityUser> users;
  int retrieve = 0;

  @override
  void initState() {
    users = widget.userPresences
        .map((e) => EntityUser.of(
            uid: e.uid,
            whenComplete: () {
              ++retrieve;
              setState(() {});
            }))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        HomeMenusButton(setSubPageRoute: widget.setSubPageRoute),
        if (retrieve != users.length) Text('${AppLocalizations.current.recoveryLoading} ${retrieve.toString()} / ${users.length}'),
        Container(
          margin: const EdgeInsets.only(top: 16),
          child: Builder(builder: (b) {
            return Column(children: users.map((e) => Container(margin: const EdgeInsets.only(bottom: 8), child: Text('${e.username}: Re. ${e.rebirths} - Lv. ${e.levels}'))).toList());
          }),
        )
      ],
    );
  }
}
