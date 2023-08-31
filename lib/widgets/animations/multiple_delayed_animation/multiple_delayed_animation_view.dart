part of multiple_delayed_animation;

class _MultipleDelayedAnimationView extends State<MultipleDelayedAnimation> {
  @override
  Widget build(BuildContext context) {
    if (widget.children.length > 1) {
      List<Widget> _widgets = [];
      for (int i = 0; i < widget.children.length; i++) {
        _widgets.add(DelayedAnimation(
            child: widget.children[i],
            duration: Duration(microseconds: widget.firstDuration.inMilliseconds + (widget.intervalDuration.inMilliseconds * i)),
            delayedAnimationController: widget.delayedAnimationController,
            animationOffSet: widget.animationOffSet));
      }
      return widget.axis == MultipleDelayedAnimationAxis.horizontal
          ? Row(mainAxisAlignment: widget.mainAxisAlignment, mainAxisSize: widget.mainAxisSize, crossAxisAlignment: widget.crossAxisAlignment, children: _widgets)
          : Column(mainAxisAlignment: widget.mainAxisAlignment, mainAxisSize: widget.mainAxisSize, crossAxisAlignment: widget.crossAxisAlignment, children: _widgets);
    } else {
      return DelayedAnimation(child: widget.children.first, duration: widget.firstDuration, animationOffSet: widget.animationOffSet);
    }
  }
}
