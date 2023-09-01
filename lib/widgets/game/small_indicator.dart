import 'package:flutter/material.dart';

class SmallIndicator extends StatelessWidget {
  SmallIndicator({super.key, required this.backgroundColor, required this.text, required this.iconData, required this.iconColor, this.onPressed, required this.withIconData});

  final Color backgroundColor;
  final String text;
  final IconData iconData;
  final Color iconColor;
  final VoidCallback? onPressed;
  final IconData withIconData;
  late final bool _withMore = onPressed != null;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            //overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            //shadowColor: MaterialStateProperty.all<Color>(Colors.black),
            //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
            padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0))),
        child: Container(
            width: 110,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4), child: Icon(iconData, size: 12, color: iconColor)),
              Container(padding: (onPressed != null) ? null : const EdgeInsets.only(right: 10), child: Text(text)),
              if (onPressed != null) Container(padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4), child: Icon(withIconData, size: 8)),
              if (onPressed == null) const SizedBox.shrink()
            ])));
  }
}
