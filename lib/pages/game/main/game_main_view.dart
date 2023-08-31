part of game_main;

class _GameMainView extends State<GameMainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => widget._createController(), child: Consumer<_GameMainController>(builder: (context, controller, child) => _buildWidget(context, controller, child)));
  }

  Widget _buildWidget(BuildContext context, _GameMainController controller, Widget? child) {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
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
            child: Text(CoreUser.instance.current.username ?? 'X'),
          ))
    ]));
  }
}
