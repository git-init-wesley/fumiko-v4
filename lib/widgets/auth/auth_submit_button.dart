import 'package:flutter/material.dart';

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({Key? key, required this.title, required this.onPressed}) : super(key: key);

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
            padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0))),
        child: Ink(
            decoration:
                BoxDecoration(gradient: const LinearGradient(colors: [Colors.red, Colors.redAccent], begin: Alignment.centerLeft, end: Alignment.centerRight), borderRadius: BorderRadius.circular(16)),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [
                BoxShadow(color: Colors.red.withOpacity(0.1), spreadRadius: 0.1, blurRadius: 4, offset: const Offset(3, 1.5)),
                BoxShadow(color: Colors.red.withOpacity(0.1), spreadRadius: 0.1, blurRadius: 4, offset: const Offset(-3, -1.5))
              ]),
              constraints: const BoxConstraints(maxWidth: 170, minHeight: 50),
              alignment: Alignment.center,
              child: Text(title.toUpperCase(),
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleLarge!.fontSize!)),
            )));
  }
}
