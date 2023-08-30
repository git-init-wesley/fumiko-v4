part of popup;

class PopupButtonWidget extends StatefulWidget {
  const PopupButtonWidget({Key? key, this.color = Colors.blue, required this.text, required this.onPressed}) : super(key: key);

  final MaterialColor color;
  final String text;
  final VoidCallback onPressed;

  @override
  State createState() => _PopupButtonWidgetState();
}
