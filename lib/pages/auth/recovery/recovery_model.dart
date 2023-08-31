part of auth_recovery;

class _AuthRecoveryModel extends PageBaseModel with PopupModel {
  final _formKey = GlobalKey<FormState>();
  final DelayedAnimationOffset delayedAnimationOffset = DelayedAnimationOffset.bottomToTopSmall;

  final TextEditingController emailAddressController = TextEditingController();

  String? errorEmailAddress;

  bool isLoading = false;
  String? loadingText;
}
