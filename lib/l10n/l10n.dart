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
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
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
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Erreur`
  String get error {
    return Intl.message(
      'Erreur',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Attention`
  String get warning {
    return Intl.message(
      'Attention',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Désactivation`
  String get deactivation {
    return Intl.message(
      'Désactivation',
      name: 'deactivation',
      desc: '',
      args: [],
    );
  }

  /// `J'ai compris`
  String get understood {
    return Intl.message(
      'J\'ai compris',
      name: 'understood',
      desc: '',
      args: [],
    );
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
  String maintenanceCurrentlyProgress(
      Object maintenanceCause, Object maintenanceEnd) {
    return Intl.message(
      '👨🏻‍🔧 Une maintenance est actuellement en cours... 👨🏻‍🔧\n\n$maintenanceCause\n\nSe termine le $maintenanceEnd (UTC+00).',
      name: 'maintenanceCurrentlyProgress',
      desc: '',
      args: [maintenanceCause, maintenanceEnd],
    );
  }

  /// `L'accès à ce compte a été temporairement désactivé en raison de nombreuses tentatives de connexion infructueuses. Vous pouvez le restaurer immédiatement en réinitialisant votre mot de passe ou réessayer plus tard. ⌛`
  String get logInTooManyRequests {
    return Intl.message(
      'L\'accès à ce compte a été temporairement désactivé en raison de nombreuses tentatives de connexion infructueuses. Vous pouvez le restaurer immédiatement en réinitialisant votre mot de passe ou réessayer plus tard. ⌛',
      name: 'logInTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Connexion`
  String get logIn {
    return Intl.message(
      'Connexion',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Connectez-vous pour entrer dans le jeu.`
  String get logInDescription {
    return Intl.message(
      'Connectez-vous pour entrer dans le jeu.',
      name: 'logInDescription',
      desc: '',
      args: [],
    );
  }

  /// `Connexion...`
  String get logInLoading {
    return Intl.message(
      'Connexion...',
      name: 'logInLoading',
      desc: '',
      args: [],
    );
  }

  /// `Se connecter`
  String get signIn {
    return Intl.message(
      'Se connecter',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Mot de passe perdu ?`
  String get forgotPassword {
    return Intl.message(
      'Mot de passe perdu ?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Vous n'avez pas encore de compte ?`
  String get doNotHaveAccountYet {
    return Intl.message(
      'Vous n\'avez pas encore de compte ?',
      name: 'doNotHaveAccountYet',
      desc: '',
      args: [],
    );
  }

  /// `S'inscrire`
  String get registerNow {
    return Intl.message(
      'S\'inscrire',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Le compte est introuvable.`
  String get accountCannotFound {
    return Intl.message(
      'Le compte est introuvable.',
      name: 'accountCannotFound',
      desc: '',
      args: [],
    );
  }

  /// `Votre compte a été désactivé. ⏳`
  String get accountDeactivated {
    return Intl.message(
      'Votre compte a été désactivé. ⏳',
      name: 'accountDeactivated',
      desc: '',
      args: [],
    );
  }

  /// `Adresse mail`
  String get emailAddress {
    return Intl.message(
      'Adresse mail',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `L'adresse mail est invalide.`
  String get emailAddressInvalid {
    return Intl.message(
      'L\'adresse mail est invalide.',
      name: 'emailAddressInvalid',
      desc: '',
      args: [],
    );
  }

  /// `L'adresse mail est deja utilise par un autre compte.`
  String get emailAlreadyInUse {
    return Intl.message(
      'L\'adresse mail est deja utilise par un autre compte.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Un mail vous a ete envoyer pour changer votre mot de passe.`
  String get emailSentChangePassword {
    return Intl.message(
      'Un mail vous a ete envoyer pour changer votre mot de passe.',
      name: 'emailSentChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Mot de passe`
  String get password {
    return Intl.message(
      'Mot de passe',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation du Mot de passe`
  String get passwordConfirmation {
    return Intl.message(
      'Confirmation du Mot de passe',
      name: 'passwordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Le mot de passe est incorrect.`
  String get passwordIncorrect {
    return Intl.message(
      'Le mot de passe est incorrect.',
      name: 'passwordIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Les mot de passe ne sont pas égaux.`
  String get passwordNotEqual {
    return Intl.message(
      'Les mot de passe ne sont pas égaux.',
      name: 'passwordNotEqual',
      desc: '',
      args: [],
    );
  }

  /// `Le mot de passe est invalide.`
  String get passwordInvalid {
    return Intl.message(
      'Le mot de passe est invalide.',
      name: 'passwordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Au moins un chiffre.\nAu moins un caractère minuscule.\nAu moins un caractère majuscule.\nAu moins un caractère special.\nAu moins 8 caractères, mais pas plus de 32.`
  String get passwordTooltip {
    return Intl.message(
      'Au moins un chiffre.\nAu moins un caractère minuscule.\nAu moins un caractère majuscule.\nAu moins un caractère special.\nAu moins 8 caractères, mais pas plus de 32.',
      name: 'passwordTooltip',
      desc: '',
      args: [],
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
