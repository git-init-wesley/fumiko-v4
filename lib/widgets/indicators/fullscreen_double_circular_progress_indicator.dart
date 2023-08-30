import 'package:flutter/material.dart';
import 'package:fumiko/widgets/indicators/double_circular_progress_indicator.dart';

class FullScreenDoubleCircularProgressIndicator extends StatefulWidget {
  const FullScreenDoubleCircularProgressIndicator({Key? key, this.alignment = Alignment.center, this.text, required this.presented, this.child}) : super(key: key);

  final Alignment alignment;
  final String? text;
  final bool presented;
  final Widget? child;

  @override
  State createState() => _FullScreenDoubleCircularProgressIndicatorState();
}

class _FullScreenDoubleCircularProgressIndicatorState extends State<FullScreenDoubleCircularProgressIndicator> with TickerProviderStateMixin {
  late AnimationController opacityAnimationController;

  @override
  void initState() {
    opacityAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    opacityAnimationController.addListener(() => setState(() {}));
    opacityAnimationController.value = widget.presented ? 1 : 0;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FullScreenDoubleCircularProgressIndicator oldWidget) {
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

  //TODO: Review
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: widget.alignment, children: [
      if (widget.child != null) AbsorbPointer(absorbing: widget.presented, child: widget.child),
      SizedBox.fromSize(
          size: widget.presented ? MediaQuery.of(context).size : const Size(0, 0),
          child: Opacity(
              opacity: opacityAnimationController.value,
              child: Center(
                  child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.9), offset: const Offset(0, 0), spreadRadius: MediaQuery.of(context).size.height)],
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.1), offset: const Offset(0, 0), spreadRadius: 1)], borderRadius: BorderRadius.circular(20)),
                        child: Container(width: 170, padding: const EdgeInsets.all(30), child: DoubleCircularProgressIndicator(text: widget.text)),
                      )))))
    ]);
  }
}
