import 'package:flutter/material.dart';

class DelayedAnimationOffset {
  final Offset _offset;

  Offset get offset => _offset;

  const DelayedAnimationOffset({required Offset offset}) : _offset = offset;

  static DelayedAnimationOffset customAnimationOffset(double dx, double dy) =>
      DelayedAnimationOffset(offset: Offset(dx, dy));

  static const DelayedAnimationOffset leftToRightSmall =
      DelayedAnimationOffset(offset: Offset(0.5, 0));
  static const DelayedAnimationOffset leftToRight =
      DelayedAnimationOffset(offset: Offset(1, 0));
  static const DelayedAnimationOffset leftToRightLarge =
      DelayedAnimationOffset(offset: Offset(1.5, 0));

  static const DelayedAnimationOffset topToBottomSmall =
      DelayedAnimationOffset(offset: Offset(0, -0.5));
  static const DelayedAnimationOffset topToBottom =
      DelayedAnimationOffset(offset: Offset(0, -1));
  static const DelayedAnimationOffset topToBottomLarge =
      DelayedAnimationOffset(offset: Offset(0, -1.5));

  static const DelayedAnimationOffset rightToLeftSmall =
      DelayedAnimationOffset(offset: Offset(-0.5, 0));
  static const DelayedAnimationOffset rightToLeft =
      DelayedAnimationOffset(offset: Offset(-1, 0));
  static const DelayedAnimationOffset rightToLeftLarge =
      DelayedAnimationOffset(offset: Offset(-1.5, 0));

  static const DelayedAnimationOffset bottomToTopSmall =
      DelayedAnimationOffset(offset: Offset(0, 0.5));
  static const DelayedAnimationOffset bottomToTop =
      DelayedAnimationOffset(offset: Offset(0, 1));
  static const DelayedAnimationOffset bottomToTopLarge =
      DelayedAnimationOffset(offset: Offset(0, 1.5));
}
