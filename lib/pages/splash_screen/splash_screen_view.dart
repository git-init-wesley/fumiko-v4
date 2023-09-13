part of splash_screen_page;

class _SplashScreenView extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => widget._createController(context: context, unknownPage: widget.unknownPage),
      child: Consumer<_SplashScreenController>(builder: (context, controller, child) => _buildWidget(context, controller, child)),
    );
  }

  Widget _buildWidget(BuildContext context, _SplashScreenController controller, Widget? child) {
    final double mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AssetsImages.fumikoIcon.toImage(width: mediaWidth * 0.3 > 250 ? 250 : mediaWidth * 0.3),
          Container(margin: const EdgeInsets.fromLTRB(30, 50, 30, 0), child: DoubleCircularProgressIndicator(text: controller.progressIndicatorText))
        ],
      )),
    );
  }
}
