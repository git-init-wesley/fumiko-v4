library splash_screen_page;

import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fumiko/core/core.dart';
import 'package:fumiko/core/data/core_data.dart';
import 'package:fumiko/exceptions/app_exceptions.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/models/page_base_model.dart';
import 'package:fumiko/utils/assets/assets_images.dart';
import 'package:fumiko/widgets/indicators/double_circular_progress_indicator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

part './splash_screen_controller.dart';
part './splash_screen_model.dart';
part './splash_screen_view.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key, this.unknownPage = false}) : super(key: key);

  final bool unknownPage;

  _SplashScreenController _createController({required BuildContext context, required bool unknownPage}) => _SplashScreenController(context: context, unknownPage: unknownPage);

  @override
  State createState() => _SplashScreenView();
}
