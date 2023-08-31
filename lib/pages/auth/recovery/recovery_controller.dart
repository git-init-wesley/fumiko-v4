part of auth_recovery;

class _AuthRecoveryController extends _AuthRecoveryModel with PopupController, AuthNavigationController {
  FormFieldValidator<String> get emailAddressValidator =>
      (String? value) => value != null && value.trim().isNotEmpty && RegExps.mail.hasMatch(value) ? null : (errorEmailAddress = AppLocalizations.current.emailAddressInvalid);

  @override
  RouterNavigationService get authNavigationService => super.navigationService;

  @override
  Future openPopup({required String title, required Color titleColor, required String description, required IconData icon, required Color iconColor}) async {
    super.openPopup(title: title, titleColor: titleColor, description: description, icon: icon, iconColor: iconColor);
    notifyListeners();
  }

  @override
  Future closePopup() async {
    super.closePopup();
    notifyListeners();
  }

  Future<void> recovery() async {
    if (!_formKey.currentState!.validate()) {
      notifyListeners();
      return;
    }

    setState(() {
      loadingText = AppLocalizations.current.recoveryLoading;
      isLoading = true;
      errorEmailAddress = null;
    });

    CoreUserAuth.recovery(
        emailAddress: emailAddressController.text,
        whenComplete: (List<AppException> appExceptions) async {
          if (appExceptions.isEmpty) {
            setState(() {
              loadingText = null;
              isLoading = false;
            });
            await openPopup(
                title: AppLocalizations.current.recovery,
                titleColor: Colors.greenAccent,
                description: AppLocalizations.current.emailSentChangePassword,
                icon: FontAwesomeIcons.circleCheck,
                iconColor: Colors.greenAccent);
            return;
          }

          if (appExceptions.contains(AuthExceptions.userNotFound())) {
            setState(() {
              loadingText = null;
              isLoading = false;
            });
            await openPopup(
                title: AppLocalizations.current.warning,
                titleColor: Colors.orangeAccent,
                description: AppLocalizations.current.accountCannotFound,
                icon: FontAwesomeIcons.circleExclamation,
                iconColor: Colors.orangeAccent);
            return;
          }

          setState(() {
            loadingText = null;
            isLoading = false;
          });
          await openPopup(
              title: AppLocalizations.current.error,
              titleColor: Colors.redAccent,
              description: AppLocalizations.current.errorOccurred,
              icon: FontAwesomeIcons.circleXmark,
              iconColor: Colors.redAccent);
        });
  }
}
