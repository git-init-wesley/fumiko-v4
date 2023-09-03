// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr_FR locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr_FR';

  static String m0(maintenanceCause, maintenanceEnd) => "👨🏻‍🔧 Une maintenance est actuellement en cours... 👨🏻‍🔧\n\n${maintenanceCause}\n\nSe termine le ${maintenanceEnd} (UTC+00).";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountCannotFound": MessageLookupByLibrary.simpleMessage("Le compte est introuvable."),
        "accountDeactivated": MessageLookupByLibrary.simpleMessage("Votre compte a été désactivé. ⏳"),
        "alliance": MessageLookupByLibrary.simpleMessage("Alliance"),
        "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage("Vous avez déjà un compte ?"),
        "checkConnectivity": MessageLookupByLibrary.simpleMessage("⌛ Vérification de la connexion... ⌛"),
        "chests": MessageLookupByLibrary.simpleMessage("Coffres"),
        "deactivation": MessageLookupByLibrary.simpleMessage("Désactivation"),
        "doNotHaveAccountYet": MessageLookupByLibrary.simpleMessage("Vous n\'avez pas encore de compte ?"),
        "emailAddress": MessageLookupByLibrary.simpleMessage("Adresse mail"),
        "emailAddressInvalid": MessageLookupByLibrary.simpleMessage("L\'adresse mail est invalide."),
        "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage("L\'adresse mail est déjà utilisée par un autre compte."),
        "emailSentChangePassword": MessageLookupByLibrary.simpleMessage("Un mail vous a été envoyer pour changer votre mot de passe."),
        "error": MessageLookupByLibrary.simpleMessage("Erreur"),
        "errorOccurred": MessageLookupByLibrary.simpleMessage("❌ Une erreur est survenue. Réessayer ultérieurement. ❌"),
        "fights": MessageLookupByLibrary.simpleMessage("Combats"),
        "forgotPassword": MessageLookupByLibrary.simpleMessage("Mot de passe perdu ?"),
        "gameLoading": MessageLookupByLibrary.simpleMessage("Chargement du jeu..."),
        "initializationGame": MessageLookupByLibrary.simpleMessage("⌛ Initialisation du jeu... ⌛"),
        "inventory": MessageLookupByLibrary.simpleMessage("Inventaire"),
        "logIn": MessageLookupByLibrary.simpleMessage("Connexion"),
        "logInDescription": MessageLookupByLibrary.simpleMessage("Connectez-vous pour entrer dans le jeu."),
        "logInLoading": MessageLookupByLibrary.simpleMessage("Connexion..."),
        "logInTooManyRequests": MessageLookupByLibrary.simpleMessage(
            "L\'accès à ce compte a été temporairement désactivé en raison de nombreuses tentatives de connexion infructueuses. Vous pouvez le restaurer immédiatement en réinitialisant votre mot de passe ou réessayer plus tard. ⌛"),
        "logout": MessageLookupByLibrary.simpleMessage("Se déconnecter"),
        "logoutLoading": MessageLookupByLibrary.simpleMessage("Déconnexion..."),
        "maintenanceCurrentlyProgress": m0,
        "map": MessageLookupByLibrary.simpleMessage("Carte"),
        "pageRecovery": MessageLookupByLibrary.simpleMessage("⌛ Récuperation de la page... ⌛"),
        "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "passwordConfirmation": MessageLookupByLibrary.simpleMessage("Confirmation du Mot de passe"),
        "passwordIncorrect": MessageLookupByLibrary.simpleMessage("Le mot de passe est incorrect."),
        "passwordInvalid": MessageLookupByLibrary.simpleMessage("Le mot de passe est invalide."),
        "passwordNotEqual": MessageLookupByLibrary.simpleMessage("Les mot de passe ne sont pas égaux."),
        "passwordTooltip": MessageLookupByLibrary.simpleMessage(
            "Au moins un chiffre.\nAu moins un caractère minuscule.\nAu moins un caractère majuscule.\nAu moins un caractère spécial.\nAu moins 8 caractères, mais pas plus de 32."),
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("Politique de confidentialité"),
        "pve": MessageLookupByLibrary.simpleMessage("JcE"),
        "pvp": MessageLookupByLibrary.simpleMessage("JcJ"),
        "quests": MessageLookupByLibrary.simpleMessage("Quêtes"),
        "recovery": MessageLookupByLibrary.simpleMessage("Recuperation"),
        "recoveryDescription": MessageLookupByLibrary.simpleMessage("Vous avez perdu votre mot de passe ?"),
        "recoveryLoading": MessageLookupByLibrary.simpleMessage("Recuperation..."),
        "registerNow": MessageLookupByLibrary.simpleMessage("S\'inscrire"),
        "registration": MessageLookupByLibrary.simpleMessage("Inscription"),
        "registrationDescription": MessageLookupByLibrary.simpleMessage("Inscrivez-vous pour entrer dans le jeu."),
        "registrationLoading": MessageLookupByLibrary.simpleMessage("Inscription..."),
        "rememberPassword": MessageLookupByLibrary.simpleMessage("Vous vous souvenez de votre mot de passe ?"),
        "settings": MessageLookupByLibrary.simpleMessage("Paramètres"),
        "shop": MessageLookupByLibrary.simpleMessage("Boutique"),
        "signIn": MessageLookupByLibrary.simpleMessage("Se connecter"),
        "termsOfServices": MessageLookupByLibrary.simpleMessage("Conditions d\'utilisations"),
        "understood": MessageLookupByLibrary.simpleMessage("J\'ai compris"),
        "updateAvailable": MessageLookupByLibrary.simpleMessage("🆕 Une mise à jour est disponible... 🆕"),
        "username": MessageLookupByLibrary.simpleMessage("Nom d\'utilisateur"),
        "usernameAlreadyTaken": MessageLookupByLibrary.simpleMessage("Le nom d\'utilisateur est déjà utilisé par un autre compte."),
        "usernameInvalid": MessageLookupByLibrary.simpleMessage("Le nom d\'utilisateur est invalide."),
        "usernameTooltip": MessageLookupByLibrary.simpleMessage(
            "Doit-être composé de chiffre.\nDoit-être composé de minuscule ou majuscule.\nNe dois pas contenir de caractère spécial sauf « ._ ».\nAu moins 3 caractères, mais pas plus de 16."),
        "verificationGame": MessageLookupByLibrary.simpleMessage("⌛ Vérification du jeu... ⌛"),
        "warning": MessageLookupByLibrary.simpleMessage("Attention"),
        "welcome": MessageLookupByLibrary.simpleMessage("Accueil")
      };
}
