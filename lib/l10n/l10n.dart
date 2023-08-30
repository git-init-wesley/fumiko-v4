// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null, 'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null, 'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `⌛ Vérification de la connexion... ⌛`
  String get checkConnectivity {
    return Intl.message(
      '⌛ Vérification de la connexion... ⌛',
      name: 'checkConnectivity',
      desc: '',
      args: [],
    );
  }

  /// `⌛ Initialisation du jeu... ⌛`
  String get initializationGame {
    return Intl.message(
      '⌛ Initialisation du jeu... ⌛',
      name: 'initializationGame',
      desc: '',
      args: [],
    );
  }

  /// `⌛ Vérification du jeu... ⌛`
  String get verificationGame {
    return Intl.message(
      '⌛ Vérification du jeu... ⌛',
      name: 'verificationGame',
      desc: '',
      args: [],
    );
  }

  /// `⌛ Récuperation de la page... ⌛`
  String get pageRecovery {
    return Intl.message(
      '⌛ Récuperation de la page... ⌛',
      name: 'pageRecovery',
      desc: '',
      args: [],
    );
  }

  /// `❌ Une erreur est survenue. Réessayer ultérieurement. ❌`
  String get errorOccurred {
    return Intl.message(
      '❌ Une erreur est survenue. Réessayer ultérieurement. ❌',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `🆕 Une mise a jour est disponible... 🆕`
  String get updateAvailable {
    return Intl.message(
      '🆕 Une mise a jour est disponible... 🆕',
      name: 'updateAvailable',
      desc: '',
      args: [],
    );
  }

  /// `👨🏻‍🔧 Une maintenance est actuellement en cours... 👨🏻‍🔧\n\n{maintenanceCause}\n\nSe termine le {maintenanceEnd} (UTC+00).`
  String maintenanceCurrentlyProgress(Object maintenanceCause, Object maintenanceEnd) {
    return Intl.message(
      '👨🏻‍🔧 Une maintenance est actuellement en cours... 👨🏻‍🔧\n\n$maintenanceCause\n\nSe termine le $maintenanceEnd (UTC+00).',
      name: 'maintenanceCurrentlyProgress',
      desc: '',
      args: [maintenanceCause, maintenanceEnd],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
