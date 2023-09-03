part of game_main;

class _GameMainController extends _GameMainModel with PopupController {
  _GameMainController() {
    pageController.addListener(() => notifyListeners());
    setState(() {
      loadingText = AppLocalizations.current.gameLoading;
      isLoading = true;
    });
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
      CoreUser.instance.current.addListener((UserChangeListener obj) {
        if (obj != null && obj.error != null) {
          openPopup(
            title: AppLocalizations.current.error,
            titleColor: Colors.redAccent,
            description: obj.error!.message ?? AppLocalizations.current.errorOccurred,
            icon: FontAwesomeIcons.circleXmark,
            iconColor: Colors.redAccent,
          );
        }

        if (CoreUser.instance.current.classes.code == UserClasses.unknown.code) {
          pageController.animateToPage(4, duration: const Duration(microseconds: 1), curve: Curves.linear);
        }

        notifyListeners();
      });

      setState(() {
        loadingText = null;
        isLoading = false;
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

  void logout() {
    setState(() {
      loadingText = AppLocalizations.current.logoutLoading;
      isLoading = true;
    });
    FirebaseAuth.instance.signOut();
  }

  void setClasses(UserClass classes) async {
    setState(() {
      loadingText = AppLocalizations.current.gameLoading;
      isLoading = true;
    });

    await CoreUser.instance.current.setClasses(classes);

    if (CoreUser.instance.current.classes.code != UserClasses.unknown.code) {
      pageController.animateToPage(0, duration: const Duration(microseconds: 1), curve: Curves.linear);
    }

    setState(() {
      loadingText = null;
      isLoading = false;
    });
  }
}
