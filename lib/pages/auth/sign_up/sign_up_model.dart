part of auth_sign_up;

class _AuthSignUpModel extends PageBaseModel with PopupModel {
  final _formKey = GlobalKey<FormState>();
  final DelayedAnimationOffset delayedAnimationOffset =
      DelayedAnimationOffset.bottomToTopSmall;

  final FocusNode emailAddressFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? errorEmailAddress;
  String? errorUsername;
  String? errorPassword;
  String? errorConfirmPassword;

  bool isLoading = false;
  String? loadingText;
}
