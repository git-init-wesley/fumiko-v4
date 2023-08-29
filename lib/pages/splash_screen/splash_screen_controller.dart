part of splash_screen_page;

class _SplashScreenController extends _SplashScreenModel {
  _SplashScreenController(
      {required BuildContext context, required bool unknownPage}) {
    _init(context: context, unknownPage: unknownPage);
  }

  Future<void> _init(
      {required BuildContext context, required bool unknownPage}) async {
    if (unknownPage) {
      await setState(
          () => progressIndicatorText = AppLocalizations.current.pageRecovery);
      Future.delayed(
          const Duration(seconds: 3), () => navigationService.back());
      return;
    }
    await setState(() => progressIndicatorText = '⌛ ... ⌛');
    //if (!FumikoCore.instance.coreInitialized && !FumikoCore.instance.startedCoreInitialized) {
    //  await setState(() => progressIndicatorText = '⌛ ... ⌛');
    //  Future.delayed(
    //      const Duration(seconds: 3),
    //          () => FumikoCore.instance.initCore(onStateChange: (FumikoCoreStates newState) {
    //        if (newState != FumikoCoreStates.uninitialized) {
    //          setState(() => progressIndicatorText = newState.message);
    //        }
    //      }, whenComplete:
    //          (IFumikoException? fumikoException, FumikoCoreData? fumikoCoreData, bool isAuthenticated) async {
    //        if (fumikoException != null) {
    //          setState(() async => progressIndicatorText =
    //              AppLocalizations.current.errorOccurred + '\n\n' + (fumikoException.message as String));
    //          try {
    //            throw fumikoException;
    //          } catch (_error, _stacktrace) {
    //            if (!kReleaseMode) {
    //              developer.log(_error.toString(), time: DateTime.now(), stackTrace: _stacktrace);
    //            }
    //          }
    //          return;
    //        }
    //        if (fumikoCoreData != null) {
    //          if (await fumikoCoreData.isUpdateAvailable) {
    //            setState(() async => progressIndicatorText = AppLocalizations.of(context).updateAvailable);
    //          }
    //          if (fumikoCoreData.isCurrentlyMaintenance) {
    //            String maintenanceEnd = DateFormat('dd MMM yyyy - hh:mm a')
    //                .format(DateTime.fromMillisecondsSinceEpoch(fumikoCoreData.maintenanceEnd, isUtc: true));
    //            setState(() async => progressIndicatorText = AppLocalizations.of(context)
    //                .maintenanceCurrentlyProgress(
    //                fumikoCoreData.getMaintenanceCauseFromLocale(await FumikoCore.instance.currentLocale),
    //                maintenanceEnd));
    //          }
    //          return;
    //        }
    //        navigationService.pushReplacementTo(isAuthenticated ? Routes.gameMain : Routes.authSignIn);
    //      }));
    //}
  }
}
