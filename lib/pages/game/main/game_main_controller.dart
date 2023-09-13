part of game_main;

typedef SetSubPageFunction = Future<void> Function(String route);
typedef SetUserClassFunction = Future<void> Function(UserClass classes);
typedef SetAbstractWidgetFunction = void Function(Widget widget);

class _GameMainController extends _GameMainModel with PopupController {
  _GameMainController() {
    setState(() {
      loadingText = AppLocalizations.current.gameLoading;
      isLoading = true;
    }).whenComplete(() {
      CoreUser.instance.load(whenComplete: () async {
        Core.instance.addListener((_) async {
          if (!CoreUser.instance.isAuthenticated) {
            navigationService.pushReplacementTo(RouterRoutes.authSignIn);
          }
          if (Core.instance.data != null && (await Core.instance.data!.isUpdateAvailable || Core.instance.data!.isCurrentlyMaintenance)) {
            navigationService.pushReplacementTo(RouterRoutes.splashScreen);
          }
        });
        CoreUserPresences.instance.addListener((_) => notifyListeners());
        CoreUser.instance.current.addListener((EntityUserChangeListener obj) async {
          if (obj != null && obj.error != null) {
            await openPopup(
              title: AppLocalizations.current.error,
              titleColor: Colors.redAccent,
              description: obj.error!.message ?? AppLocalizations.current.errorOccurred,
              icon: FontAwesomeIcons.circleXmark,
              iconColor: Colors.redAccent,
            );
          }
          if (CoreUser.instance.current.classes.code == UserClasses.unknown.code) {
            await setSubPageRoute(GameMainSubPages.chooseClassesRoute);
          } else {
            await setSubPageRoute(GameMainSubPages.homeRoute);
          }

          notifyListeners();
        });

        await setState(() {
          loadingText = null;
          isLoading = false;
        });
      });
    });
  }

  @override
  Future openPopup({required String title, required Color titleColor, required String description, required IconData icon, required Color iconColor}) async {
    super.openPopup(title: title, titleColor: titleColor, description: description, icon: icon, iconColor: iconColor);
    notifyListeners();
  }

  @override
  Future closePopup() async {
    super.closePopup();
    notifyListeners();
  }

  Future<void> logout() async {
    await setState(() {
      loadingText = AppLocalizations.current.logoutLoading;
      isLoading = true;
    });
    await CoreUser.instance.unload();
  }

  Future<void> setSubPageRoute(String route) async {
    await setState(() {
      subPageRoute = route;
    });
  }

  void setAbstractWidget(Widget widget) async {
    super.abstractWidget = widget;
    setSubPageRoute(GameMainSubPages.abstractWidget);
  }

  Future<void> setClasses(UserClass classes) async {
    await setState(() {
      loadingText = AppLocalizations.current.gameLoading;
      isLoading = true;
    });

    await CoreUser.instance.current.setClasses(classes);

    if (CoreUser.instance.current.classes.code != UserClasses.unknown.code) {
      await setSubPageRoute(GameMainSubPages.homeRoute);
    }

    await setState(() {
      loadingText = null;
      isLoading = false;
    });
  }
}
