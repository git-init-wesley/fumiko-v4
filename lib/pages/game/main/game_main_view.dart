part of game_main;

class _GameMainView extends State<GameMainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => widget._createController(), child: Consumer<_GameMainController>(builder: (context, controller, child) => _buildWidget(context, controller, child)));
  }

  Widget _buildWidget(BuildContext context, _GameMainController controller, Widget? child) {
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
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(key: controller._gameHeaderKey, child: GameHeader(exp: CoreUser.instance.current.exp, maxExp: CoreUser.instance.current.maxExp)),
                            Container(key: controller._gameSubheaderKey, child: GameSubheader()),
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              width: mediaWidth,
                              height: mediaHeight -
                                  8 -
                                  ((controller._gameHeaderKey.currentContext?.findRenderObject() as RenderBox?)?.size.height ?? 0) -
                                  ((controller._gameSubheaderKey.currentContext?.findRenderObject() as RenderBox?)?.size.height ?? 0),
                              child: PageView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: controller.pageController,
                                children: [Ink(color: Colors.transparent)],
                              ),
                            ),
                            Transform.scale(scale: 0, child: Text(CoreUser.instance.current.exp.toString())),
                            const Text('v1.0.0#0000'), //TODO: Copyright, Versioning...
                          ],
                        )),
                  ))
            ])));
  }
}
