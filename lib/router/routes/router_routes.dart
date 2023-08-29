part of router;

class RouterRoute {
  final String _name, _route;
  final Widget _createPage;

  String get name => _name;

  String get route => _route;

  Widget get createPage => _createPage;

  const RouterRoute(
      {required String name, required String route, required Widget createPage})
      : _name = name,
        _route = route,
        _createPage = createPage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouterRoute &&
          runtimeType == other.runtimeType &&
          _name == other._name &&
          _route == other._route;

  @override
  int get hashCode => _name.hashCode ^ _route.hashCode;
}

class RouterRoutes {
  static const RouterRoute _unknown = RouterRoute(
      name: 'Unknown',
      route: '/unknown',
      createPage: SplashScreenPage(unknownPage: true));

  static RouterRoute get unknown => _unknown;

  static const RouterRoute _splashScreen = RouterRoute(
      name: 'SplashScreen', route: '/', createPage: SplashScreenPage());

  static RouterRoute get splashScreen => _splashScreen;

  static List<RouterRoute> get baseRoutes => [unknown, splashScreen];

  static List<RouterRoute> get routes =>
      baseRoutes; // + authenticationRoutes + gamesRoutes;

  static List<String> get routesName => routes.map((e) => e.route).toList();

  static Map<String, RouterRoute> get mapRoutesName =>
      Map.fromIterables(routesName, routes);

  static RouterRoute fromRouteName(String? route) => mapRoutesName.entries
      .firstWhere((e) => e.value.route == route,
          orElse: () => MapEntry<String, RouterRoute>(unknown.route, unknown))
      .value;

  static bool isBaseRoutes(RouterRoute routes) => baseRoutes.contains(routes);
}
