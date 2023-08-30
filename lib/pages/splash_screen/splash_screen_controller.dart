part of splash_screen_page;

class _SplashScreenController extends _SplashScreenModel {
  _SplashScreenController({required BuildContext context, required bool unknownPage}) {
    _init(context: context, unknownPage: unknownPage);
  }

  Future<void> _init({required BuildContext context, required bool unknownPage}) async {
    if (unknownPage) {
      await setState(() => progressIndicatorText = AppLocalizations.current.pageRecovery);
      Future.delayed(const Duration(seconds: 3), () => navigationService.back());
      return;
    }

    if (Core.instance.isInitialized || Core.instance.isStartedInitialization) {
      return;
    }

    await setState(() => progressIndicatorText = '⌛ ... ⌛');

    Core.instance.init(
      onStateChange: (newState) => setState(() => progressIndicatorText = newState.message),
      whenComplete: (AppException? appException, CoreData? coreData, bool isAuthenticated) async {
        if (appException != null) {
          setState(() => progressIndicatorText = '${AppLocalizations.current.errorOccurred}\n\n${appException.message ?? ''}');
          try {
            appException.makeThrow();
          } catch (error, stacktrace) {
            if (!kReleaseMode) {
              developer.log(error.toString(), time: DateTime.now(), stackTrace: stacktrace);
            }
          }
          return;
        }

        if (coreData != null) {
          if (await coreData.isUpdateAvailable) {
            setState(() async => progressIndicatorText = AppLocalizations.current.updateAvailable);
          }
          if (coreData.isCurrentlyMaintenance) {
            String currentLocale = await Core.instance.currentLocale;
            String maintenanceEnd = DateFormat('dd MMM yyyy - hh:mm a', currentLocale).format(DateTime.fromMillisecondsSinceEpoch(coreData.maintenanceEnd, isUtc: true));
            setState(() async => progressIndicatorText = AppLocalizations.current.maintenanceCurrentlyProgress(coreData.getMaintenanceCauseFromLocale(currentLocale), maintenanceEnd));
          }
          return;
        }

        //TODO: Pages
        //navigationService.pushReplacementTo(isAuthenticated ? RouterRoutes.gameMain : RouterRoutes.authSignIn);
      },
    );
  }
}
