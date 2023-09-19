import 'package:flutter/material.dart';

class DoubleCircularProgressIndicator extends StatelessWidget {
  const DoubleCircularProgressIndicator(
      {Key? key, this.circularColor = Colors.white, this.text, this.fontSize})
      : super(key: key);

  final Color circularColor;
  final String? text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(alignment: Alignment.center, children: [
            CircularProgressIndicator(color: circularColor, strokeWidth: 3),
            Transform.rotate(
                angle: 90,
                child: Transform.scale(
                    scale: 0.7,
                    child: CircularProgressIndicator(color: circularColor))),
          ]),
          if (text != null && text is String)
            Container(
              margin: const EdgeInsets.only(top: 8),
              constraints: const BoxConstraints(maxWidth: 350),
              child: Text(text!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize)),
            )
        ]);
  }
}
