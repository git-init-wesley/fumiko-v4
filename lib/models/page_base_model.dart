import 'package:flutter/material.dart';
import 'package:fumiko/core/core.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:fumiko/router/services/router_services.dart';

class PageBaseModel extends ChangeNotifier {
  final RouterNavigationService _navigationService = RouterService.instance.locator<RouterNavigationService>();

  RouterNavigationService get navigationService => _navigationService;

  Future<void> setState(Function() function) async {
    await function();
    notifyListeners();
  }

  Future<dynamic> changeLanguage(Locale locale) async {
    await setState(() async {
      await Core.instance.sharedPreferences!.setString('fumiko-locale', locale.toLanguageTag());
      await AppLocalizations.delegate.load(locale);
    });
  }

  Future<String> get currentLocale => Core.instance.currentLocale;
}
