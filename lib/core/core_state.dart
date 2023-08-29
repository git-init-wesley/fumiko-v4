part of core;

enum CoreStates {
  uninitialized,
  startInitialisation,
  initLanguage,
  checkConnectivity,
  initFirebase,
  initFirebaseAppCheck,
  retrieveCoreData,
  initialized
}

extension CoreState on CoreStates {
  String _message() {
    switch (this) {
      case CoreStates.initialized:
      case CoreStates.uninitialized:
      case CoreStates.initLanguage:
      case CoreStates.startInitialisation:
        return '⌛ ... ⌛';
      case CoreStates.checkConnectivity:
        return AppLocalizations.current.checkConnectivity;
      case CoreStates.initFirebase:
        return AppLocalizations.current.initializationGame;
      case CoreStates.initFirebaseAppCheck:
      case CoreStates.retrieveCoreData:
        return AppLocalizations.current.verificationGame;
    }
  }

  String get message => _message();
}
