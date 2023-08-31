library auth_recovery;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fumiko/core/user/core_user.dart';
import 'package:fumiko/exceptions/app_exceptions.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/models/page_base_model.dart';
import 'package:fumiko/pages/auth/controllers/auth_navigation_controller.dart';
import 'package:fumiko/router/services/router_services.dart';
import 'package:fumiko/utils/assets/assets_images.dart';
import 'package:fumiko/utils/regexp.dart';
import 'package:fumiko/widgets/animations/delayed_animation/delayed_animation_widget.dart';
import 'package:fumiko/widgets/animations/multiple_delayed_animation/multiple_delayed_animation_widget.dart';
import 'package:fumiko/widgets/animations/utils/delayed_animation_offset.dart';
import 'package:fumiko/widgets/animations/utils/multiple_delayed_animation_axis.dart';
import 'package:fumiko/widgets/auth/auth_submit_button.dart';
import 'package:fumiko/widgets/auth/auth_text_field.dart';
import 'package:fumiko/widgets/indicators/fullscreen_double_circular_progress_indicator.dart';
import 'package:fumiko/widgets/popup/popup_widget.dart';
import 'package:provider/provider.dart';

part './recovery_controller.dart';
part './recovery_model.dart';
part './recovery_view.dart';

class AuthRecoveryPage extends StatefulWidget {
  const AuthRecoveryPage({Key? key}) : super(key: key);

  _AuthRecoveryController _createController() => _AuthRecoveryController();

  @override
  State createState() => _AuthRecoveryView();
}
