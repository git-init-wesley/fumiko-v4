part of game_main;

class _GameMainView extends State<GameMainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => widget._createController(), child: Consumer<_GameMainController>(builder: (context, controller, child) => _buildWidget(context, controller, child)));
  }

  Widget _buildWidget(BuildContext context, _GameMainController controller, Widget? child) {
    final Widget? tooltipMobileExpProgressIndicator =
        kIsWeb ? Text('${CoreUser.instance.current.exp}/${CoreUser.instance.current.maxExp}', style: const TextStyle(color: Colors.white, fontSize: 12)) : null;
    final double mediaWidth = MediaQuery.of(context).size.width;
    final double mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: AbsorbPointer(
            absorbing: !CoreUser.instance.isLoaded || controller.isLoading,
            child: Stack(alignment: Alignment.center, children: [
              PopupWidget(
                  title: controller.popupTitle,
                  titleColor: controller.popupTitleColor,
                  description: controller.popupDescription,
                  icon: controller.popupIcon,
                  iconColor: controller.popupIconColor,
                  presented: controller.popupPresented,
                  buttons: [
                    PopupButtonWidget(color: Colors.red, text: AppLocalizations.of(context).understood, onPressed: controller.closePopup),
                  ],
                  onTap: controller.closePopup,
                  child: FullScreenDoubleCircularProgressIndicator(
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    text: controller.loadingText,
                    presented: controller.isLoading,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GameHeader(),
                            GameSubheader(),
                            Transform.scale(scale: 0, child: Text(CoreUser.instance.current.exp.toString())),
                          ],
                        )),
                  ))
            ])));
  }
}
