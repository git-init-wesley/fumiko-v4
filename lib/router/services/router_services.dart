library router;

import 'package:flutter/material.dart';
import 'package:fumiko/core/core.dart';
import 'package:fumiko/core/user/core_user.dart';
import 'package:fumiko/pages/auth/recovery/recovery_page.dart';
import 'package:fumiko/pages/auth/sign_in/sign_in_page.dart';
import 'package:fumiko/pages/auth/sign_up/sign_up_page.dart';
import 'package:fumiko/pages/game/main/game_main_page.dart';
import 'package:fumiko/pages/splash_screen/splash_screen_page.dart';
import 'package:get_it/get_it.dart';

part '../routes/router_routes.dart';

class RouterNavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<Object?> pushTo(RouterRoute route, {dynamic arguments}) async =>
      navigatorKey.currentState!.pushNamed(route.name, arguments: arguments);

  Future<Object?> pushReplacementTo(RouterRoute route,
          {dynamic arguments}) async =>
      navigatorKey.currentState!
          .pushReplacementNamed(route.route, arguments: arguments);

  Future<void> back() async => navigatorKey.currentState?.pop();
}

class RouterService {
  RouterService._() {
    _locator.registerLazySingleton(() => RouterNavigationService());
  }

  static final RouterService _instance = RouterService._();

  static RouterService get instance => _instance;

  final GetIt _locator = GetIt.instance;

  GetIt get locator => _locator;

  Route onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(builder: (context) {
        final RouterRoute generateRoute =
            RouterRoutes.fromRouteName(settings.name);

        //if (Core.instance.data != null && (await Core.instance.data!.isUpdateAvailable || Core.instance.data!.isCurrentlyMaintenance)) {
        //  return RouterRoutes.splashScreen.createPage;
        //}

        if (!Core.instance.isInitialized &&
            !RouterRoutes.baseRoutes.contains(generateRoute)) {
          return RouterRoutes.splashScreen.createPage;
        } else if (!CoreUser.instance.isAuthenticated &&
            !RouterRoutes.isAuthenticationRoutes(generateRoute) &&
            !RouterRoutes.isBaseRoutes(generateRoute)) {
          return RouterRoutes.authSignIn.createPage;
        } else if (CoreUser.instance.isAuthenticated &&
            !RouterRoutes.isGameRoutes(generateRoute) &&
            !RouterRoutes.isBaseRoutes(generateRoute)) {
          return RouterRoutes.gameMain.createPage;
        }
        return generateRoute.createPage;
      });
}
