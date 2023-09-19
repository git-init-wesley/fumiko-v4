import 'package:flutter/material.dart';

class MenusButton extends StatelessWidget {
  const MenusButton(
      {Key? key,
      this.height = 42,
      this.maxWidth = 320,
      required this.color,
      required this.iconData,
      required this.text,
      this.textSize,
      this.onPressed})
      : super(key: key);

  final double height;
  final double maxWidth;
  final Color color;
  final IconData iconData;
  final String text;
  final double? textSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(Size(0, height)),
            maximumSize: MaterialStateProperty.all<Size>(
                Size(maxWidth, double.infinity)),
            backgroundColor:
                MaterialStateProperty.all<Color>(color.withOpacity(0.75)),
            overlayColor:
                MaterialStateProperty.all<Color>(color.withOpacity(0.6)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.black),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)))),
        onPressed: onPressed,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(iconData,
                  size: textSize ??
                      Theme.of(context).textTheme.titleLarge?.fontSize),
              Container(
                  margin: const EdgeInsets.only(left: 4),
                  child: Text(text.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: textSize ??
                              Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.fontSize)))
            ]));
  }
}
