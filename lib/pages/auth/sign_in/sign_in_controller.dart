part of auth_sign_in;

class _AuthSignInController extends _AuthSignInModel
    with PopupController, AuthNavigationController {
  FormFieldValidator<String> get emailAddressValidator => (String? value) =>
      value != null && value.trim().isNotEmpty && RegExps.mail.hasMatch(value)
          ? null
          : (errorEmailAddress = AppLocalizations.current.emailAddressInvalid);

  FormFieldValidator<String> get passwordValidator =>
      (String? value) => value != null &&
              value.trim().isNotEmpty &&
              RegExps.password.hasMatch(value)
          ? null
          : (errorPassword = AppLocalizations.current.passwordInvalid +
              (kIsWeb
                  ? ''
                  : '\n\n${AppLocalizations.current.passwordTooltip}'));

  @override
  RouterNavigationService get authNavigationService => super.navigationService;

  @override
  Future openPopup(
      {required String title,
      required Color titleColor,
      required String description,
      required IconData icon,
      required Color iconColor}) async {
    super.openPopup(
        title: title,
        titleColor: titleColor,
        description: description,
        icon: icon,
        iconColor: iconColor);
    notifyListeners();
  }

  @override
  Future closePopup() async {
    super.closePopup();
    notifyListeners();
  }

  Future<void> signIn() async {
    if (!_formKey.currentState!.validate()) {
      notifyListeners();
      return;
    }

    await setState(() {
      loadingText = AppLocalizations.current.logInLoading;
      isLoading = true;
      errorEmailAddress = null;
      errorPassword = null;
    });

    await CoreUserAuth.signIn(
        emailAddress: emailAddressController.text,
        password: passwordController.text,
        whenComplete: (List<AppException> appExceptions) async {
          if (appExceptions.isEmpty) {
            await setState(() {
              loadingText = null;
              isLoading = false;
            });
            navigationService.pushReplacementTo(RouterRoutes.gameMain);
            return;
          }

          if (appExceptions
              .where((e) =>
                  e.code == AuthExceptions.userNotFound().code ||
                  e.code == AuthExceptions.tooManyRequests().code ||
                  e.code == AuthExceptions.invalidEmail().code ||
                  e.code == AuthExceptions.wrongPassword().code)
              .isNotEmpty) {
            await openPopup(
                title: AppLocalizations.current.warning,
                titleColor: Colors.orangeAccent,
                description:
                    appExceptions.contains(AuthExceptions.userNotFound())
                        ? AppLocalizations.current.accountCannotFound
                        : appExceptions.contains(AuthExceptions.invalidEmail())
                            ? AppLocalizations.current.emailAddressInvalid
                            : appExceptions
                                    .contains(AuthExceptions.tooManyRequests())
                                ? AppLocalizations.current.logInTooManyRequests
                                : AppLocalizations.current.passwordIncorrect,
                icon: FontAwesomeIcons.circleExclamation,
                iconColor: Colors.orangeAccent);
          } else if (appExceptions.contains(AuthExceptions.userDisabled()) ||
              appExceptions.isNotEmpty) {
            await openPopup(
                title: appExceptions.contains(AuthExceptions.userDisabled())
                    ? AppLocalizations.current.deactivation
                    : AppLocalizations.current.error,
                titleColor: Colors.redAccent,
                description:
                    appExceptions.contains(AuthExceptions.userDisabled())
                        ? AppLocalizations.current.accountDeactivated
                        : AppLocalizations.current.errorOccurred,
                icon: FontAwesomeIcons.circleXmark,
                iconColor: Colors.redAccent);
          }

          await setState(() {
            loadingText = null;
            isLoading = false;
          });
        });
  }
}
