import 'package:flutter/material.dart';
import 'package:fumiko/entities/user/user.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/pages/game/main/game_main_page.dart';
import 'package:fumiko/pages/game/main/widgets/game_header.dart';
import 'package:fumiko/pages/game/statique/home_menus_button.dart';

class GameUsers extends StatefulWidget {
  const GameUsers({super.key, required this.userPresences, required this.setSubPageRoute, required this.onChange});

  final VoidCallback onChange;
  final List<EntityUserPresence> userPresences;
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
            //TODO Update List
            return ListBody(
                children: users.map((e) {
              return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
                      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent.withOpacity(0)),
                      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent.withOpacity(0.2)),
                      shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {},
                    child: GameHeader(
                      widthOffSet: -32,
                      username: e.username,
                      levels: e.levels,
                      rebirths: e.rebirths,
                      exp: e.exp,
                      maxExp: e.maxExp,
                      classes: e.classes,
                    ),
                  ));
            }).toList());
          }),
        )
      ],
    );
  }
}
