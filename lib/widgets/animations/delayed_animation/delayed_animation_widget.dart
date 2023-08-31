library delayed_animation;

import 'package:flutter/material.dart';
import 'package:fumiko/widgets/animations/utils/delayed_animation_offset.dart';

part 'delayed_animation_controller.dart';
part 'delayed_animation_view.dart';

class DelayedAnimation extends StatefulWidget {
  const DelayedAnimation({Key? key, required this.duration, this.delayedAnimationController, required this.animationOffSet, required this.child}) : super(key: key);

  final Duration duration;
  final DelayedAnimationController? delayedAnimationController;
  final DelayedAnimationOffset animationOffSet;
  final Widget child;

  @override
  State createState() => _DelayedAnimationView();
}
