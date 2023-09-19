part of auth_sign_up;

class _AuthSignUpController extends _AuthSignUpModel
    with PopupController, AuthNavigationController {
  FormFieldValidator<String> get emailAddressValidator => (String? value) =>
      value != null && value.trim().isNotEmpty && RegExps.mail.hasMatch(value)
          ? null
          : (errorEmailAddress = AppLocalizations.current.emailAddressInvalid);

  FormFieldValidator<String> get usernameValidator =>
      (String? value) => value != null &&
              value.trim().isNotEmpty &&
              RegExps.username.hasMatch(value)
          ? null
          : (errorUsername = AppLocalizations.current.usernameInvalid +
              (kIsWeb
                  ? ''
                  : '\n\n${AppLocalizations.current.usernameTooltip}'));

  FormFieldValidator<String> get passwordValidator =>
      (String? value) => value != null &&
              value.trim().isNotEmpty &&
              RegExps.password.hasMatch(value)
          ? null
          : (errorPassword = AppLocalizations.current.passwordInvalid +
              (kIsWeb
                  ? ''
                  : '\n\n${AppLocalizations.current.passwordTooltip}'));

  FormFieldValidator<String> get confirmPasswordValidator =>
      (String? value) => value != null &&
              value.trim().isNotEmpty &&
              value == passwordController.text
          ? null
          : (errorConfirmPassword = AppLocalizations.current.passwordNotEqual);

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

  Future<void> signUp() async {
    if (!_formKey.currentState!.validate()) {
      notifyListeners();
      return;
    }

    await setState(() {
      loadingText = AppLocalizations.current.registrationLoading;
      isLoading = true;
      errorEmailAddress = null;
      errorUsername = null;
      errorPassword = null;
      errorConfirmPassword = null;
    });

    CoreUserAuth.signUp(
        emailAddress: emailAddressController.text,
        username: usernameController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
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
                  e.code == AuthExceptions.usernameAlreadyTaken().code ||
                  e.code == AuthExceptions.emailAlreadyInUse().code)
              .isNotEmpty) {
            await openPopup(
                title: AppLocalizations.current.warning,
                titleColor: Colors.orangeAccent,
                description: appExceptions
                        .contains(AuthExceptions.usernameAlreadyTaken())
                    ? AppLocalizations.current.usernameAlreadyTaken
                    : AppLocalizations.current.emailAlreadyInUse,
                icon: FontAwesomeIcons.circleExclamation,
                iconColor: Colors.orangeAccent);
          } else if (appExceptions.isNotEmpty) {
            await openPopup(
                title: AppLocalizations.current.error,
                titleColor: Colors.redAccent,
                description: AppLocalizations.current.errorOccurred,
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
