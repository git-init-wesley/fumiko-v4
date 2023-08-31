library multiple_delayed_animation;

import 'package:flutter/material.dart';
import 'package:fumiko/widgets/animations/delayed_animation/delayed_animation_widget.dart';
import 'package:fumiko/widgets/animations/utils/delayed_animation_offset.dart';
import 'package:fumiko/widgets/animations/utils/multiple_delayed_animation_axis.dart';

part './multiple_delayed_animation_view.dart';

class MultipleDelayedAnimation extends StatefulWidget {
  const MultipleDelayedAnimation({
    Key? key,
    required this.axis,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.firstDuration,
    required this.intervalDuration,
    this.delayedAnimationController,
    required this.animationOffSet,
    required this.children,
  }) : super(key: key);

  final MultipleDelayedAnimationAxis axis;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final Duration firstDuration;
  final Duration intervalDuration;
  final DelayedAnimationController? delayedAnimationController;
  final DelayedAnimationOffset animationOffSet;
  final List<Widget> children;

  @override
  State createState() => _MultipleDelayedAnimationView();
}
