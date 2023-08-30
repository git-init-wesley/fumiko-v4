import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.errorText,
      this.focusNode,
      this.textInputAction = TextInputAction.done,
      required this.textInputType,
      required this.secure,
      required this.controller,
      this.validator,
      this.onSubmitted})
      : super(key: key);

  final IconData icon;
  final String hintText;
  final String? errorText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType textInputType;
  final bool secure;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 20),
        child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: TextFormField(
              focusNode: focusNode,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              obscureText: secure,
              autocorrect: false,
              controller: controller,
              onFieldSubmitted: onSubmitted,
              validator: validator,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.05),
                  prefixIcon: Icon(icon, color: errorText != null ? Colors.redAccent : null),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(width: 2, color: Colors.redAccent)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.1))),
                  hintText: hintText.toUpperCase(),
                  errorText: errorText,
                  errorStyle: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleSmall!.fontSize)),
            )));
  }
}
