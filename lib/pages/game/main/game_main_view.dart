part of game_main;

class GameMainSubPages {
  GameMainSubPages._();

  static const String homeRoute = 'home';

  static Widget home({required SetSubPageFunction setSubPageRoute}) => GameHome(setSubPageRoute: setSubPageRoute);

  static const String fightsRoute = 'fights';

  static Widget fights({required SetSubPageFunction setSubPageRoute}) => GameFights(setSubPageRoute: setSubPageRoute);

  static const String settingsRoute = 'settings';

  static Widget settings({required SetSubPageFunction setSubPageRoute, required Future<void> Function() logout}) => GameSettings(setSubPageRoute: setSubPageRoute, logout: logout);

  static const String viewUsersRoute = 'view-users';

  static Widget viewUsers({required SetSubPageFunction setSubPageRoute, required VoidCallback onChange}) =>
      GameUsers(userPresences: CoreUserPresences.instance.onlineUsers, setSubPageRoute: setSubPageRoute, onChange: onChange);

  static const String chooseClassesRoute = 'choose-classes';

  static Widget chooseClasses({required BuildContext context, required Future<void> Function(UserClass) setClasses}) =>
      GameChooseClasses(setClasses: setClasses, fontSize: Theme.of(context).textTheme.titleLarge?.fontSize ?? 0);

  static const String pvpRoute = 'pvp';
  static const String pveRoute = 'pve';
  static const String staminaRoute = 'stamina';
  static const String shopPrimaryRoute = 'shop-primary';
  static const String shopSecondaryRoute = 'shop-secondary';
  static const String statsRoute = 'stats';
  static const String rankingsRoute = 'rankings';
  static const String abstractWidget = 'abstract-widget';
}

class _GameMainView extends State<GameMainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => widget._createController(), child: Consumer<_GameMainController>(builder: (context, controller, child) => _buildWidget(context, controller, child)));
  }

  double _getWidgetPageHeight({required _GameMainController controller, required double mediaHeight}) {
    const double minHeight = 0; //480;
    double algo = mediaHeight -
        8 -
        ((controller._gameHeaderKey.currentContext?.findRenderObject() as RenderBox?)?.size.height ?? 0) -
        ((controller._gameSubheaderKey.currentContext?.findRenderObject() as RenderBox?)?.size.height ?? 0);
    return max(algo, minHeight);
  }

  Widget _buildWidgetPage({required BuildContext context, required _GameMainController controller}) {
    switch (controller.subPageRoute) {
      case GameMainSubPages.fightsRoute:
        return GameMainSubPages.fights(setSubPageRoute: controller.setSubPageRoute);
      case GameMainSubPages.settingsRoute:
        return GameMainSubPages.settings(setSubPageRoute: controller.setSubPageRoute, logout: controller.logout);
      case GameMainSubPages.viewUsersRoute:
        return GameMainSubPages.viewUsers(setSubPageRoute: controller.setSubPageRoute, onChange: () => setState(() {}));
      case GameMainSubPages.chooseClassesRoute:
        return GameMainSubPages.chooseClasses(context: context, setClasses: controller.setClasses);
      case GameMainSubPages.abstractWidget:
        return controller.abstractWidget;
      default:
        return GameMainSubPages.home(setSubPageRoute: controller.setSubPageRoute);
    }
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
                                  setSubPageRoute: controller.setSubPageRoute,
                                  stamina: CoreUser.instance.current.stamina,
                                  primary: CoreUser.instance.current.primary,
                                  secondary: CoreUser.instance.current.secondary,
                                  power: CoreUser.instance.current.power,
                                  trophies: CoreUser.instance.current.trophies,
                                  onlineUsers: CoreUserPresences.instance.onlineUsers.length,
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 8),
                                width: mediaWidth,
                                constraints: BoxConstraints(minHeight: _getWidgetPageHeight(controller: controller, mediaHeight: mediaHeight)),
                                child: _buildWidgetPage(context: context, controller: controller)),
                          ],
                        )),
                  ))
            ])));
  }
}
