part of delayed_animation;

class _DelayedAnimationView extends State<DelayedAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final CurvedAnimation _curvedAnimation;
  late final Animation<Offset> _animationOffSet;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _animationController.addListener(() => setState(() {}));
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.decelerate);
    _animationOffSet =
        Tween<Offset>(begin: widget.animationOffSet.offset, end: Offset.zero)
            .animate(_curvedAnimation);
    if (widget.delayedAnimationController?.autoStart ?? true) {
      _animationController.forward();
    } else if (widget.delayedAnimationController != null) {
      widget.delayedAnimationController!.startAnimations
          .add(() => _animationController.forward());
    }
    super.initState();
  }

  @override
  void dispose() {
    _curvedAnimation.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animationController,
        child:
            SlideTransition(position: _animationOffSet, child: widget.child));
  }
}
