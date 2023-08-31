library popup;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'popup_controller.dart';
part 'popup_model.dart';
part 'popup_view.dart';
part 'widgets/popup_button_view.dart';
part 'widgets/popup_button_widget.dart';

class PopupWidget extends StatefulWidget {
  const PopupWidget(
      {Key? key,
      this.alignment = Alignment.center,
      required this.title,
      this.titleColor = Colors.blue,
      this.icon,
      this.iconColor = Colors.blue,
      required this.description,
      required this.presented,
      this.buttons,
      this.onTap,
      this.child})
      : super(key: key);

  final Alignment alignment;
  final String title;
  final Color titleColor;
  final IconData? icon;
  final Color iconColor;
  final String description;
  final bool presented;
  final List<PopupButtonWidget>? buttons;
  final GestureTapCallback? onTap;
  final Widget? child;

  @override
  State createState() => _PopupView();
}
