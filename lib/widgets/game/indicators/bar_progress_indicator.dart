import 'dart:math';

import 'package:flutter/material.dart';

//TODO: A revoir
class BarProgressIndicator extends StatefulWidget {
  const BarProgressIndicator({Key? key, required this.value, required this.height, required this.width, required this.backgroundColor, required this.foregroundColor, this.child}) : super(key: key);

  final double value;
  final double height;
  final double width;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget? child;

  @override
  State createState() => _BarProgressIndicatorState();
}

class _BarProgressIndicatorState extends State<BarProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    double finalValue = min(max(widget.value, 0), 1).toDouble();
    return Ink(
      decoration: BoxDecoration(color: widget.backgroundColor, borderRadius: BorderRadius.circular(2), boxShadow: [BoxShadow(color: widget.backgroundColor, blurRadius: 2, spreadRadius: 0.1)]),
      height: widget.height,
      child: Stack(alignment: Alignment.centerLeft, children: [
        if (finalValue > 0)
          Ink(
            decoration: BoxDecoration(color: widget.foregroundColor, borderRadius: BorderRadius.circular(2), boxShadow: [BoxShadow(color: widget.foregroundColor, blurRadius: 2, spreadRadius: 0.1)]),
            height: widget.height,
            width: widget.width * finalValue,
          ),
        if (widget.child != null) Container(alignment: Alignment.center, width: widget.width, child: widget.child!)
      ]),
    );
  }
}
