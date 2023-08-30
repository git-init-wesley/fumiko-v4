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

  //TODO: A revoir
  Widget _buttons(double mediaWidth) {
    if (widget.buttons?.isNotEmpty ?? false) {
      List<Widget> widgets = [];
      for (List<PopupButtonWidget> elements in widget.buttons!) {
        if (mediaWidth > 360 && elements.length == 2) {
          if (mediaWidth < 600) {
            for (int i = 0; i < elements.length; i++) {
              if (i + 1 <= elements.length) {
                widgets.add(Row(mainAxisSize: MainAxisSize.min, children: elements.sublist(i, i + 1)));
              } else {
                widgets.add(elements.elementAt(i));
              }
            }
          } else {
            widgets.add(Row(mainAxisSize: MainAxisSize.min, children: elements));
          }
        } else {
          for (var element in elements) {
            widgets.add(element);
          }
        }
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
              child: Stack(alignment: widget.alignment, children: [
                SizedBox.fromSize(size: MediaQuery.of(context).size, child: GestureDetector(onTap: widget.onTap)),
                Center(
                    child: Container(
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.9), offset: const Offset(0, 0), spreadRadius: MediaQuery.of(context).size.height)],
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                            decoration:
                                BoxDecoration(boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.1), offset: const Offset(0, 0), spreadRadius: 1)], borderRadius: BorderRadius.circular(20)),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
                              Container(margin: const EdgeInsets.all(10), padding: const EdgeInsets.all(30), child: Transform.scale(scale: 3, child: Icon(widget.icon, color: widget.iconColor))),
                              Text(widget.title, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: widget.titleColor)),
                              Container(
                                  width: 350,
                                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Text(widget.description, style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center)),
                              Container(margin: EdgeInsets.only(bottom: widget.buttons?.isNotEmpty ?? false ? 20 : 0), child: _buttons(mediaWidth))
                            ]))))
              ])))
    ]);
  }
}
