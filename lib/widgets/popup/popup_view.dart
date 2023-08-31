part of popup;

class _PopupView extends State<PopupWidget> with TickerProviderStateMixin {
  late final AnimationController opacityAnimationController;

  @override
  void initState() {
    opacityAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    opacityAnimationController.addListener(() => setState(() {}));
    opacityAnimationController.value = widget.presented ? 1 : 0;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PopupWidget oldWidget) {
    if (widget.presented) {
      opacityAnimationController.forward();
    } else {
      opacityAnimationController.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    opacityAnimationController.dispose();
    super.dispose();
  }

  Widget _buttons(double mediaWidth) {
    if (widget.buttons?.isNotEmpty ?? false) {
      List<Widget> widgets = [];
      for (PopupButtonWidget elements in widget.buttons!) {
        widgets.add(elements);
      }
      return Column(children: widgets);
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    return Stack(alignment: widget.alignment, children: [
      if (widget.child != null) AbsorbPointer(absorbing: widget.presented, child: widget.child!),
      SizedBox.fromSize(
          size: widget.presented ? MediaQuery.of(context).size : const Size(0, 0),
          child: Opacity(
              opacity: opacityAnimationController.value,
              child: Stack(
                alignment: widget.alignment,
                children: [
                  SizedBox.fromSize(size: MediaQuery.of(context).size, child: GestureDetector(onTap: widget.onTap)),
                  Center(
                      child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.9), offset: const Offset(0, 0), spreadRadius: MediaQuery.of(context).size.height)],
                              borderRadius: BorderRadius.circular(16)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration:
                                BoxDecoration(boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.1), offset: const Offset(0, 0), spreadRadius: 1)], borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(bottom: 4), padding: const EdgeInsets.all(32), child: Transform.scale(scale: 3, child: Icon(widget.icon, color: widget.iconColor))),
                                Text(widget.title.toUpperCase(), style: TextStyle(color: widget.titleColor, fontSize: Theme.of(context).textTheme.titleLarge?.fontSize, fontWeight: FontWeight.bold)),
                                Container(
                                    constraints: const BoxConstraints(maxWidth: 350),
                                    margin: EdgeInsets.only(top: 12, bottom: (widget.buttons != null ? 8 : 0)),
                                    child: Text(widget.description, style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center)),
                                Container(child: _buttons(mediaWidth))
                              ],
                            ),
                          )))
                ],
              )))
    ]);
  }
}
