part of game_main;

class _GameMainView extends State<GameMainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => widget._createController(), child: Consumer<_GameMainController>(builder: (context, controller, child) => _buildWidget(context, controller, child)));
  }

  double getWidgetPageHeight({required _GameMainController controller, required double mediaHeight}) {
    const double minHeight = 480;
    double algo = mediaHeight -
        8 -
        ((controller._gameHeaderKey.currentContext?.findRenderObject() as RenderBox?)?.size.height ?? 0) -
        ((controller._gameSubheaderKey.currentContext?.findRenderObject() as RenderBox?)?.size.height ?? 0);
    return max(algo, minHeight);
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
                            Container(
                                key: controller._gameHeaderKey,
                                child: GameHeader(
                                  classes: CoreUser.instance.current.classes,
                                  username: CoreUser.instance.current.username,
                                  levels: CoreUser.instance.current.levels,
                                  rebirths: CoreUser.instance.current.rebirths,
                                  exp: CoreUser.instance.current.exp,
                                  maxExp: CoreUser.instance.current.maxExp,
                                )),
                            Container(
                                key: controller._gameSubheaderKey,
                                child: GameSubheader(
                                  pageController: controller.pageController,
                                  primary: CoreUser.instance.current.primary,
                                  secondary: CoreUser.instance.current.secondary,
                                  power: CoreUser.instance.current.power,
                                  trophies: CoreUser.instance.current.trophies,
                                  shopPrimaryPage: 0,
                                  shopSecondaryPage: 0,
                                  statsPage: 0,
                                  rankingsPage: 0,
                                  presencesPage: 3,
                                  onlineUsers: CoreUserPresences.instance.onlineUsers.length,
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 8),
                                width: mediaWidth,
                                height: getWidgetPageHeight(controller: controller, mediaHeight: mediaHeight),
                                child: PageView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: controller.pageController,
                                  children: [
                                    GameHome(
                                      pageController: controller.pageController,
                                      fightsPage: 1,
                                      settingsPage: 2,
                                    ),
                                    GameFights(
                                      pageController: controller.pageController,
                                      pvpPage: 0,
                                      pvePage: 0,
                                    ),
                                    GameSettings(pageController: controller.pageController, logout: controller.logout),
                                    GameUsers(
                                      userPresences: CoreUserPresences.instance.onlineUsers,
                                      pageController: controller.pageController,
                                      onChange: () => setState(() {}),
                                    )
                                  ],
                                )),
                            Transform.scale(scale: 0, child: Text(CoreUser.instance.current.exp.toString())),
                            Text('v${Core.instance.packageInfo?.version ?? '0.0.0'}#${Core.instance.packageInfo?.buildNumber ?? '0000'}'), //TODO: Copyright, Versioning...
                          ],
                        )),
                  ))
            ])));
  }
}
