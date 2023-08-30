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

  static String m0(maintenanceCause, maintenanceEnd) =>
      "👨🏻‍🔧 Une maintenance est actuellement en cours... 👨🏻‍🔧\n\n${maintenanceCause}\n\nSe termine le ${maintenanceEnd} (UTC+00).";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "checkConnectivity": MessageLookupByLibrary.simpleMessage(
            "⌛ Vérification de la connexion... ⌛"),
        "doNotHaveAccountYet": MessageLookupByLibrary.simpleMessage(
            "Vous n\'avez pas encore de compte ?"),
        "emailAddress": MessageLookupByLibrary.simpleMessage("Adresse mail"),
        "emailAddressInvalid": MessageLookupByLibrary.simpleMessage(
            "L\'adresse mail est invalide."),
        "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
            "L\'adresse mail est deja utilise par un autre compte."),
        "emailSentChangePassword": MessageLookupByLibrary.simpleMessage(
            "Un mail vous a ete envoyer pour changer votre mot de passe."),
        "errorOccurred": MessageLookupByLibrary.simpleMessage(
            "❌ Une erreur est survenue. Réessayer ultérieurement. ❌"),
        "forgotPassword":
            MessageLookupByLibrary.simpleMessage("Mot de passe perdu ?"),
        "initializationGame": MessageLookupByLibrary.simpleMessage(
            "⌛ Initialisation du jeu... ⌛"),
        "logIn": MessageLookupByLibrary.simpleMessage("Connexion"),
        "logInDescription": MessageLookupByLibrary.simpleMessage(
            "Connectez-vous pour entrer dans le jeu."),
        "logInLoading": MessageLookupByLibrary.simpleMessage("Connexion..."),
        "maintenanceCurrentlyProgress": m0,
        "pageRecovery": MessageLookupByLibrary.simpleMessage(
            "⌛ Récuperation de la page... ⌛"),
        "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "passwordConfirmation": MessageLookupByLibrary.simpleMessage(
            "Confirmation du Mot de passe"),
        "passwordIncorrect": MessageLookupByLibrary.simpleMessage(
            "Le mot de passe est incorrect."),
        "passwordInvalid": MessageLookupByLibrary.simpleMessage(
            "Le mot de passe est invalide."),
        "passwordNotEqual": MessageLookupByLibrary.simpleMessage(
            "Les mot de passe ne sont pas égaux."),
        "passwordTooltip": MessageLookupByLibrary.simpleMessage(
            "Au moins un chiffre.\nAu moins un caractère minuscule.\nAu moins un caractère majuscule.\nAu moins un caractère special.\nAu moins 8 caractères, mais pas plus de 32."),
        "registerNow": MessageLookupByLibrary.simpleMessage("S\'inscrire"),
        "signIn": MessageLookupByLibrary.simpleMessage("Se connecter"),
        "understood": MessageLookupByLibrary.simpleMessage("J\'ai compris"),
        "updateAvailable": MessageLookupByLibrary.simpleMessage(
            "🆕 Une mise a jour est disponible... 🆕"),
        "verificationGame":
            MessageLookupByLibrary.simpleMessage("⌛ Vérification du jeu... ⌛")
      };
}