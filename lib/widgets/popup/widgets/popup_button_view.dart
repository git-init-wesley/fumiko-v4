part of popup;

class _PopupButtonWidgetState extends State<PopupButtonWidget> {
  @override
  Widget build(BuildContext context) {
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
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: widget.color.withOpacity(0.1), spreadRadius: 0.1, blurRadius: 4, offset: const Offset(3, 1.5)),
                        BoxShadow(color: widget.color.withOpacity(0.1), spreadRadius: 0.1, blurRadius: 4, offset: const Offset(-3, -1.5))
                      ],
                    ),
                    constraints: const BoxConstraints(maxWidth: 256, minHeight: 48),
                    alignment: Alignment.center,
                    child: Text(widget.text.toUpperCase(),
                        textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.titleLarge?.fontSize))))));
  }
}
