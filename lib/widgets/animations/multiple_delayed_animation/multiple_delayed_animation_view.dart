part of multiple_delayed_animation;

class _MultipleDelayedAnimationView extends State<MultipleDelayedAnimation> {
  @override
  Widget build(BuildContext context) {
    if (widget.children.length > 1) {
      List<Widget> buildWidgets = [];
      for (int i = 0; i < widget.children.length; i++) {
        buildWidgets.add(DelayedAnimation(
            duration: Duration(microseconds: widget.firstDuration.inMilliseconds + (widget.intervalDuration.inMilliseconds * i)),
            delayedAnimationController: widget.delayedAnimationController,
            animationOffSet: widget.animationOffSet,
            child: widget.children[i]));
      }
      return widget.axis == MultipleDelayedAnimationAxis.horizontal
          ? Row(mainAxisAlignment: widget.mainAxisAlignment, mainAxisSize: widget.mainAxisSize, crossAxisAlignment: widget.crossAxisAlignment, children: buildWidgets)
          : Column(mainAxisAlignment: widget.mainAxisAlignment, mainAxisSize: widget.mainAxisSize, crossAxisAlignment: widget.crossAxisAlignment, children: buildWidgets);
    } else {
      return DelayedAnimation(duration: widget.firstDuration, animationOffSet: widget.animationOffSet, child: widget.children.first);
    }
  }
}
