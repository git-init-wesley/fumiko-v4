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

  /// `Conditions d'utilisations`
  String get termsOfServices {
    return Intl.message(
      'Conditions d\'utilisations',
      name: 'termsOfServices',
      desc: '',
      args: [],
    );
  }

  /// `Politique de confidentialité`
  String get privacyPolicy {
    return Intl.message(
      'Politique de confidentialité',
      name: 'privacyPolicy',
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

  /// `🆕 Une mise à jour est disponible... 🆕`
  String get updateAvailable {
    return Intl.message(
      '🆕 Une mise à jour est disponible... 🆕',
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

  /// `Recuperation`
  String get recovery {
    return Intl.message(
      'Recuperation',
      name: 'recovery',
      desc: '',
      args: [],
    );
  }

  /// `Vous avez perdu votre mot de passe ?`
  String get recoveryDescription {
    return Intl.message(
      'Vous avez perdu votre mot de passe ?',
      name: 'recoveryDescription',
      desc: '',
      args: [],
    );
  }

  /// `Recuperation...`
  String get recoveryLoading {
    return Intl.message(
      'Recuperation...',
      name: 'recoveryLoading',
      desc: '',
      args: [],
    );
  }

  /// `Inscription`
  String get registration {
    return Intl.message(
      'Inscription',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Inscrivez-vous pour entrer dans le jeu.`
  String get registrationDescription {
    return Intl.message(
      'Inscrivez-vous pour entrer dans le jeu.',
      name: 'registrationDescription',
      desc: '',
      args: [],
    );
  }

  /// `Inscription...`
  String get registrationLoading {
    return Intl.message(
      'Inscription...',
      name: 'registrationLoading',
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

  /// `Vous avez déjà un compte ?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Vous avez déjà un compte ?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Vous vous souvenez de votre mot de passe ?`
  String get rememberPassword {
    return Intl.message(
      'Vous vous souvenez de votre mot de passe ?',
      name: 'rememberPassword',
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

  /// `L'adresse mail est déjà utilisée par un autre compte.`
  String get emailAlreadyInUse {
    return Intl.message(
      'L\'adresse mail est déjà utilisée par un autre compte.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Un mail vous a été envoyer pour changer votre mot de passe.`
  String get emailSentChangePassword {
    return Intl.message(
      'Un mail vous a été envoyer pour changer votre mot de passe.',
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

  /// `Au moins un chiffre.\nAu moins un caractère minuscule.\nAu moins un caractère majuscule.\nAu moins un caractère spécial.\nAu moins 8 caractères, mais pas plus de 32.`
  String get passwordTooltip {
    return Intl.message(
      'Au moins un chiffre.\nAu moins un caractère minuscule.\nAu moins un caractère majuscule.\nAu moins un caractère spécial.\nAu moins 8 caractères, mais pas plus de 32.',
      name: 'passwordTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Nom d'utilisateur`
  String get username {
    return Intl.message(
      'Nom d\'utilisateur',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Le nom d'utilisateur est déjà utilisé par un autre compte.`
  String get usernameAlreadyTaken {
    return Intl.message(
      'Le nom d\'utilisateur est déjà utilisé par un autre compte.',
      name: 'usernameAlreadyTaken',
      desc: '',
      args: [],
    );
  }

  /// `Le nom d'utilisateur est invalide.`
  String get usernameInvalid {
    return Intl.message(
      'Le nom d\'utilisateur est invalide.',
      name: 'usernameInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Doit-être composé de chiffre.\nDoit-être composé de minuscule ou majuscule.\nNe dois pas contenir de caractère spécial sauf « ._ ».\nAu moins 3 caractères, mais pas plus de 16.`
  String get usernameTooltip {
    return Intl.message(
      'Doit-être composé de chiffre.\nDoit-être composé de minuscule ou majuscule.\nNe dois pas contenir de caractère spécial sauf « ._ ».\nAu moins 3 caractères, mais pas plus de 16.',
      name: 'usernameTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Chargement du jeu...`
  String get gameLoading {
    return Intl.message(
      'Chargement du jeu...',
      name: 'gameLoading',
      desc: '',
      args: [],
    );
  }

  /// `Accueil`
  String get welcome {
    return Intl.message(
      'Accueil',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Combats`
  String get fights {
    return Intl.message(
      'Combats',
      name: 'fights',
      desc: '',
      args: [],
    );
  }

  /// `Inventaire`
  String get inventory {
    return Intl.message(
      'Inventaire',
      name: 'inventory',
      desc: '',
      args: [],
    );
  }

  /// `Quêtes`
  String get quests {
    return Intl.message(
      'Quêtes',
      name: 'quests',
      desc: '',
      args: [],
    );
  }

  /// `Carte`
  String get map {
    return Intl.message(
      'Carte',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Alliance`
  String get alliance {
    return Intl.message(
      'Alliance',
      name: 'alliance',
      desc: '',
      args: [],
    );
  }

  /// `Boutique`
  String get shop {
    return Intl.message(
      'Boutique',
      name: 'shop',
      desc: '',
      args: [],
    );
  }

  /// `Coffres`
  String get chests {
    return Intl.message(
      'Coffres',
      name: 'chests',
      desc: '',
      args: [],
    );
  }

  /// `Paramètres`
  String get settings {
    return Intl.message(
      'Paramètres',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Se déconnecter`
  String get logout {
    return Intl.message(
      'Se déconnecter',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Déconnexion...`
  String get logoutLoading {
    return Intl.message(
      'Déconnexion...',
      name: 'logoutLoading',
      desc: '',
      args: [],
    );
  }

  /// `JcJ`
  String get pvp {
    return Intl.message(
      'JcJ',
      name: 'pvp',
      desc: '',
      args: [],
    );
  }

  /// `Return PvP`
  String get returnPvp {
    return Intl.message(
      'Return PvP',
      name: 'returnPvp',
      desc: '',
      args: [],
    );
  }

  /// `JcE`
  String get pve {
    return Intl.message(
      'JcE',
      name: 'pve',
      desc: '',
      args: [],
    );
  }

  /// `Return PvE`
  String get returnPve {
    return Intl.message(
      'Return PvE',
      name: 'returnPve',
      desc: '',
      args: [],
    );
  }

  /// `Mage`
  String get mage {
    return Intl.message(
      'Mage',
      name: 'mage',
      desc: '',
      args: [],
    );
  }

  /// `Les Mages sont l'artillerie lourde d'un groupe, ils lancent de puissants sorts à distance sur une ou plusieurs cibles. Les ennemis s'enfuient dès qu'ils entendent leurs redoutables incantations.`
  String get mageDescription {
    return Intl.message(
      'Les Mages sont l\'artillerie lourde d\'un groupe, ils lancent de puissants sorts à distance sur une ou plusieurs cibles. Les ennemis s\'enfuient dès qu\'ils entendent leurs redoutables incantations.',
      name: 'mageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Guerrier`
  String get warrior {
    return Intl.message(
      'Guerrier',
      name: 'warrior',
      desc: '',
      args: [],
    );
  }

  /// `Puissants, d'un courage sans limite, et possédant de fantastiques compétences de combat, les Guerriers sont toujours prêts à attaquer l'ennemi. Pilier de tout groupe et source de sa puissance, les Guerriers affrontent les ennemis en combat rapprochent pendant que leurs partenaires assurent leurs arrières.`
  String get warriorDescription {
    return Intl.message(
      'Puissants, d\'un courage sans limite, et possédant de fantastiques compétences de combat, les Guerriers sont toujours prêts à attaquer l\'ennemi. Pilier de tout groupe et source de sa puissance, les Guerriers affrontent les ennemis en combat rapprochent pendant que leurs partenaires assurent leurs arrières.',
      name: 'warriorDescription',
      desc: '',
      args: [],
    );
  }

  /// `Ninja`
  String get ninja {
    return Intl.message(
      'Ninja',
      name: 'ninja',
      desc: '',
      args: [],
    );
  }

  /// `Grâce à leur rapidité et leur agilité incroyables, les Ninja sont des experts des dégâts infligés dans un laps de temps très court. Ce sont des assassins entraînés qui ont appris à déceler la moindre faiblesse de leur ennemi pour en tirer avantage. À chaque coup porté par leurs griffes ou par leurs lames, les Ninja acquièrent une âme, essence de vie qu’ils emploient pour lancer des attaques féroces suffisamment puissantes pour mettre à genoux même les adversaires les plus coriaces.`
  String get ninjaDescription {
    return Intl.message(
      'Grâce à leur rapidité et leur agilité incroyables, les Ninja sont des experts des dégâts infligés dans un laps de temps très court. Ce sont des assassins entraînés qui ont appris à déceler la moindre faiblesse de leur ennemi pour en tirer avantage. À chaque coup porté par leurs griffes ou par leurs lames, les Ninja acquièrent une âme, essence de vie qu’ils emploient pour lancer des attaques féroces suffisamment puissantes pour mettre à genoux même les adversaires les plus coriaces.',
      name: 'ninjaDescription',
      desc: '',
      args: [],
    );
  }

  /// `Choisir la classe {className}`
  String chooseClassX(Object className) {
    return Intl.message(
      'Choisir la classe $className',
      name: 'chooseClassX',
      desc: '',
      args: [className],
    );
  }

  /// `attaque`
  String get attacks {
    return Intl.message(
      'attaque',
      name: 'attacks',
      desc: '',
      args: [],
    );
  }

  /// `critique`
  String get critical {
    return Intl.message(
      'critique',
      name: 'critical',
      desc: '',
      args: [],
    );
  }

  /// `et inflige`
  String get andDeals {
    return Intl.message(
      'et inflige',
      name: 'andDeals',
      desc: '',
      args: [],
    );
  }

  /// `dégât{plural}`
  String damage(Object plural) {
    return Intl.message(
      'dégât$plural',
      name: 'damage',
      desc: '',
      args: [plural],
    );
  }

  /// `Tour{plural} {number}`
  String rounds(Object plural, Object number) {
    return Intl.message(
      'Tour$plural $number',
      name: 'rounds',
      desc: '',
      args: [plural, number],
    );
  }

  /// `remporte le combat`
  String get winsFight {
    return Intl.message(
      'remporte le combat',
      name: 'winsFight',
      desc: '',
      args: [],
    );
  }

  /// `Vous avez gagné`
  String get youHaveWin {
    return Intl.message(
      'Vous avez gagné',
      name: 'youHaveWin',
      desc: '',
      args: [],
    );
  }

  /// `Points d'expérience`
  String get experiencePoints {
    return Intl.message(
      'Points d\'expérience',
      name: 'experiencePoints',
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
