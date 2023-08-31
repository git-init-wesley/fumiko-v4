part of auth_sign_in;

class _AuthSignInModel extends PageBaseModel with PopupModel {
  final _formKey = GlobalKey<FormState>();

  final DelayedAnimationOffset delayedAnimationOffset = DelayedAnimationOffset.bottomToTopSmall;

  final FocusNode emailAddressFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? currentErrorEmailAddress;
  String? currentErrorPassword;

  bool currentLoading = false;
  String? currentLoadingText;
}
