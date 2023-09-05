part of game_main;

class _GameMainModel extends PageBaseModel with PopupModel {
  String subPageRoute = GameMainSubPages.homeRoute;

  final GlobalKey _gameHeaderKey = GlobalKey();
  final GlobalKey _gameSubheaderKey = GlobalKey();

  bool isLoading = true;
  String? loadingText;
}
