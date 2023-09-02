part of game_main;

class _GameMainModel extends PageBaseModel with PopupModel {
  final PageController pageController = PageController(keepPage: false);

  final GlobalKey _gameHeaderKey = GlobalKey();
  final GlobalKey _gameSubheaderKey = GlobalKey();

  bool isLoading = true;
  String? loadingText;
}
