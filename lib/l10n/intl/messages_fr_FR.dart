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
        "checkConnectivity": MessageLookupByLibrary.simpleMessage("⌛ Vérification de la connexion... ⌛"),
        "errorOccurred": MessageLookupByLibrary.simpleMessage("❌ Une erreur est survenue. Réessayer ultérieurement. ❌"),
        "initializationGame": MessageLookupByLibrary.simpleMessage("⌛ Initialisation du jeu... ⌛"),
        "maintenanceCurrentlyProgress": m0,
        "pageRecovery": MessageLookupByLibrary.simpleMessage("⌛ Récuperation de la page... ⌛"),
        "updateAvailable": MessageLookupByLibrary.simpleMessage("🆕 Une mise a jour est disponible... 🆕"),
        "verificationGame": MessageLookupByLibrary.simpleMessage("⌛ Vérification du jeu... ⌛")
      };
}
