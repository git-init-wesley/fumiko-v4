part of game_main;

class _GameMainController extends _GameMainModel with PopupController {
  _GameMainController() {
    setState(() {
      loadingText = AppLocalizations.current.gameLoading;
      isLoading = true;
    });
    CoreUser.instance.load().whenComplete(() {
      CoreUser.instance.current.addListener(() => notifyListeners());
      //TODO: Check if classe has been chosen.
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
}
