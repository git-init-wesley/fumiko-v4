import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/router/services/router_services.dart';
import 'package:intl/intl.dart';

Future main() async {
  Intl.defaultLocale = 'fr_FR';
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fumiko',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.red,
        highlightColor: Colors.red,
        scrollbarTheme: ScrollbarThemeData(
          interactive: true,
          radius: const Radius.circular(16),
          thumbColor: MaterialStateProperty.all(Colors.red[400]),
          thickness: MaterialStateProperty.all(5),
        ),
        fontFamily: 'Dosis',
        tooltipTheme: const TooltipThemeData(decoration: ShapeDecoration(color: Color(0xFF232426), shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))))),
      ),
      themeMode: ThemeMode.light,
      localizationsDelegates: const [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      onGenerateRoute: RouterService.instance.onGenerateRoute,
      navigatorKey: RouterService.instance.locator<RouterNavigationService>().navigatorKey,
      supportedLocales: AppLocalizations.delegate.supportedLocales,
    );
  }
}
