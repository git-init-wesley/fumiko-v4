library pve_details;

import 'dart:async';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fumiko/core/user/core_user.dart';
import 'package:fumiko/entities/entity/entity.dart';
import 'package:fumiko/entities/monster/monster.dart';
import 'package:fumiko/entities/user/classes/user_classes.dart';
import 'package:fumiko/entities/user/user.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/models/page_base_model.dart';
import 'package:fumiko/pages/game/main/game_main_page.dart';
import 'package:fumiko/pages/game/statique/home_menus_button.dart';
import 'package:fumiko/utils/number_formatter.dart';
import 'package:fumiko/widgets/game/buttons/menus_button.dart';
import 'package:fumiko/widgets/game/indicators/bar_progress_indicator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

part './game_fights_pve_details_controller.dart';
part './game_fights_pve_details_model.dart';
part './game_fights_pve_details_view.dart';

class GameFightsPveDetailsPage extends StatefulWidget {
  const GameFightsPveDetailsPage(
      {super.key,
      required this.monster,
      required this.user,
      required this.setSubPageRoute,
      required this.repeat});

  final SetSubPageFunction setSubPageRoute;
  final VoidCallback repeat;
  final EntityMonster monster;
  final EntityUser user;

  _GameFightsPveDetailsController _createController(
          {required BuildContext context}) =>
      _GameFightsPveDetailsController(
          context: context, user: user, monster: monster);

  @override
  State createState() => _GameFightsPveDetailsView();
}
