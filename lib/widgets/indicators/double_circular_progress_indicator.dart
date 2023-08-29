import 'package:flutter/material.dart';

class DoubleCircularProgressIndicator extends StatelessWidget {
  const DoubleCircularProgressIndicator(
      {Key? key, this.circularColor = Colors.white, this.text})
      : super(key: key);

  final Color circularColor;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(children: [
            CircularProgressIndicator(
              color: circularColor,
              strokeWidth: 3,
            ),
            Transform.rotate(
                angle: 90,
                child: Transform.scale(
                    scale: 0.7,
                    child: CircularProgressIndicator(
                      color: circularColor,
                    ))),
          ]),
          if (text != null)
            Container(
                margin: const EdgeInsets.only(top: 20),
                width: 350,
                child: Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
        ]);
  }
}
