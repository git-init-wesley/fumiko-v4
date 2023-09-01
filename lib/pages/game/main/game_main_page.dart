library game_main;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fumiko/core/user/core_user.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/models/page_base_model.dart';
import 'package:fumiko/pages/game/main/widgets/game_header.dart';
import 'package:fumiko/pages/game/main/widgets/game_subheader.dart';
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
