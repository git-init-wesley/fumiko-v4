part of popup;

class _PopupButtonWidgetState extends State<PopupButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    return Transform.scale(
        scale: 0.7,
        child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(0))),
            child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [widget.color, widget.color.shade900], begin: Alignment.centerLeft, end: Alignment.centerRight), borderRadius: BorderRadius.circular(16)),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      boxShadow: [
                        BoxShadow(color: widget.color.withOpacity(0.1), spreadRadius: 0.1, blurRadius: 7, offset: const Offset(6, 3)),
                        BoxShadow(color: widget.color.withOpacity(0.1), spreadRadius: 0.1, blurRadius: 7, offset: const Offset(-6, -3))
                      ],
                    ),
                    constraints: BoxConstraints(maxWidth: kIsWeb ? (mediaWidth * 0.4 > 200 ? 200 : mediaWidth * 0.4) : (mediaWidth * 0.8 > 200 ? 200 : mediaWidth * 0.8), minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(widget.text, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: Theme.of(context).textTheme.titleLarge?.fontSize))))));
  }
}
