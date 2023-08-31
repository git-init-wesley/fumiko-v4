part of delayed_animation;

class DelayedAnimationController {
  final bool autoStart;

  List<VoidCallback> startAnimations = [];

  void startAnimation() {
    for (VoidCallback startAnimation in startAnimations) {
      try {
        startAnimation.call();
      } catch (_) {
        startAnimations.remove(startAnimation);
      }
    }
  }

  DelayedAnimationController({required this.autoStart});
}
