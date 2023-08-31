part of router;

class RouterRoute {
  final String _name, _route;
  final Widget _createPage;

  String get name => _name;

  String get route => _route;

  Widget get createPage => _createPage;

  const RouterRoute({required String name, required String route, required Widget createPage})
      : _name = name,
        _route = route,
        _createPage = createPage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RouterRoute && runtimeType == other.runtimeType && _name == other._name && _route == other._route;

  @override
  int get hashCode => _name.hashCode ^ _route.hashCode;
}

class RouterRoutes {
  RouterRoutes._();

  static const RouterRoute _unknown = RouterRoute(name: 'Unknown', route: '/unknown', createPage: SplashScreenPage(unknownPage: true));

  static RouterRoute get unknown => _unknown;

  static const RouterRoute _splashScreen = RouterRoute(name: 'SplashScreen', route: '/', createPage: SplashScreenPage());

  static RouterRoute get splashScreen => _splashScreen;

  static const RouterRoute _authSignIn = RouterRoute(name: 'Authentication Sign In', route: '/auth/sign-in', createPage: AuthSignInPage());

  static RouterRoute get authSignIn => _authSignIn;

  static const RouterRoute _authSignUp = RouterRoute(name: 'Authentication Sign Up', route: '/auth/sign-up', createPage: AuthSignUpPage());

  static RouterRoute get authSignUp => _authSignUp;

  static const RouterRoute _authRecovery = RouterRoute(name: 'Authentication Recovery', route: '/auth/recovery', createPage: AuthRecoveryPage());

  static RouterRoute get authRecovery => _authRecovery;

  static const RouterRoute _gameMain = RouterRoute(name: 'Game Main', route: '/game/main', createPage: GameMainPage());

  static RouterRoute get gameMain => _gameMain;

  static List<RouterRoute> get baseRoutes => [unknown, splashScreen];

  static List<RouterRoute> get authenticationRoutes => [authSignIn, authSignUp, authRecovery];

  static List<RouterRoute> get gameRoutes => [gameMain];

  static List<RouterRoute> get routes => baseRoutes + authenticationRoutes + gameRoutes; // + authenticationRoutes + gamesRoutes;

  static List<String> get routesName => routes.map((e) => e.route).toList();

  static Map<String, RouterRoute> get mapRoutesName => Map.fromIterables(routesName, routes);

  static RouterRoute fromRouteName(String? route) => mapRoutesName.entries.firstWhere((e) => e.value.route == route, orElse: () => MapEntry<String, RouterRoute>(unknown.route, unknown)).value;

  static bool isBaseRoutes(RouterRoute routes) => baseRoutes.contains(routes);

  static bool isAuthenticationRoutes(RouterRoute routes) => authenticationRoutes.contains(routes);

  static bool isGameRoutes(RouterRoute routes) => gameRoutes.contains(routes);
}
