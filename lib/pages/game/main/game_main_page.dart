library game_main;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fumiko/core/core.dart';
import 'package:fumiko/core/user/core_user.dart';
import 'package:fumiko/entities/user/classes/user_classes.dart';
import 'package:fumiko/entities/user/user.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/models/page_base_model.dart';
import 'package:fumiko/pages/game/choose_classes/game_choose_classes.dart';
import 'package:fumiko/pages/game/fights/game_fights.dart';
import 'package:fumiko/pages/game/fights/pve/game_fights_pve.dart';
import 'package:fumiko/pages/game/home/game_home.dart';
import 'package:fumiko/pages/game/main/widgets/game_header.dart';
import 'package:fumiko/pages/game/main/widgets/game_subheader.dart';
import 'package:fumiko/pages/game/settings/game_settings.dart';
import 'package:fumiko/pages/game/users/game_view_users.dart';
import 'package:fumiko/router/services/router_services.dart';
import 'package:fumiko/utils/typedefs.dart';
import 'package:fumiko/widgets/indicators/fullscreen_double_circular_progress_indicator.dart';
import 'package:fumiko/widgets/popup/popup_widget.dart';
import 'package:provider/provider.dart';

part './game_main_controller.dart';
part './game_main_model.dart';
part './game_main_view.dart';

class GameMainPage extends StatefulWidget {
  const GameMainPage({Key? key}) : super(key: key);

  _GameMainController _createController() => _GameMainController();

  @override
  State createState() => _GameMainView();
}
