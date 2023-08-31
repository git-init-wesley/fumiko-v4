part of auth_sign_up;

class _AuthSignUpView extends State<AuthSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => widget._createController(), child: Consumer<_AuthSignUpController>(builder: (context, controller, child) => _buildWidget(context, controller, child)));
  }

  Widget _buildWidget(BuildContext context, _AuthSignUpController controller, Widget? child) {
    List<Widget> childrenRGPD = [
      TextButton(
          style: ButtonStyle(shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
          onPressed: null,
          child: Text(AppLocalizations.of(context).termsOfServices, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent))),
      TextButton(
          style: ButtonStyle(shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
          onPressed: null,
          child: Text(AppLocalizations.of(context).privacyPolicy, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)))
    ];
    if (MediaQuery.of(context).size.width >= 512) {
      childrenRGPD.insert(1, const Text('&'));
    }
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      PopupWidget(
          title: controller.popupTitle,
          titleColor: controller.popupTitleColor,
          description: controller.popupDescription,
          icon: controller.popupIcon,
          iconColor: controller.popupIconColor,
          presented: controller.popupPresented,
          buttons: [
            PopupButtonWidget(color: Colors.red, text: AppLocalizations.of(context).understood, onPressed: controller.closePopup),
          ],
          onTap: controller.closePopup,
          child: FullScreenDoubleCircularProgressIndicator(
              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
              text: controller.loadingText,
              presented: controller.isLoading,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 48),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          alignment: kIsWeb ? Alignment.topCenter : Alignment.topLeft,
                          child: MultipleDelayedAnimation(
                              axis: MultipleDelayedAnimationAxis.vertical,
                              mainAxisAlignment: kIsWeb ? MainAxisAlignment.center : MainAxisAlignment.start,
                              crossAxisAlignment: kIsWeb ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                              firstDuration: const Duration(milliseconds: 400),
                              intervalDuration: const Duration(milliseconds: 100),
                              animationOffSet: controller.delayedAnimationOffset,
                              children: [
                                AssetsImages.fumikoIcon.toImage(alignment: kIsWeb ? Alignment.center : Alignment.centerLeft, height: 200),
                                Text(AppLocalizations.of(context).registration, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.displayMedium!.fontSize)),
                                Text(AppLocalizations.of(context).registrationDescription, style: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.titleLarge!.fontSize))
                              ]),
                        ),
                        DelayedAnimation(
                            duration: const Duration(milliseconds: 700),
                            animationOffSet: controller.delayedAnimationOffset,
                            child: Form(
                                key: controller._formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        alignment: kIsWeb ? Alignment.topCenter : Alignment.topLeft,
                                        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
                                          AuthField(
                                              icon: FontAwesomeIcons.envelope,
                                              hintText: AppLocalizations.of(context).emailAddress,
                                              errorText: controller.errorEmailAddress,
                                              focusNode: controller.emailAddressFocusNode,
                                              textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.emailAddress,
                                              secure: false,
                                              controller: controller.emailAddressController,
                                              validator: controller.emailAddressValidator,
                                              onSubmitted: (String? _) => FocusScope.of(context).requestFocus(controller.usernameFocusNode)),
                                          Tooltip(
                                              message: AppLocalizations.of(context).usernameTooltip,
                                              textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              padding: const EdgeInsets.all(8),
                                              child: AuthField(
                                                  icon: FontAwesomeIcons.userTag,
                                                  hintText: AppLocalizations.of(context).username,
                                                  errorText: controller.errorUsername,
                                                  focusNode: controller.usernameFocusNode,
                                                  textInputAction: TextInputAction.next,
                                                  textInputType: TextInputType.text,
                                                  secure: false,
                                                  controller: controller.usernameController,
                                                  validator: controller.usernameValidator,
                                                  onSubmitted: (String? _) => FocusScope.of(context).requestFocus(controller.passwordFocusNode))),
                                          Tooltip(
                                              message: AppLocalizations.of(context).passwordTooltip,
                                              textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                              padding: const EdgeInsets.all(8),
                                              child: AuthField(
                                                  icon: FontAwesomeIcons.lock,
                                                  hintText: AppLocalizations.of(context).password,
                                                  errorText: controller.errorPassword,
                                                  focusNode: controller.passwordFocusNode,
                                                  textInputAction: TextInputAction.done,
                                                  textInputType: TextInputType.visiblePassword,
                                                  secure: true,
                                                  controller: controller.passwordController,
                                                  validator: controller.passwordValidator,
                                                  onSubmitted: (String? _) => FocusScope.of(context).requestFocus(controller.confirmPasswordFocusNode))),
                                          AuthField(
                                              icon: FontAwesomeIcons.lock,
                                              hintText: AppLocalizations.of(context).passwordConfirmation,
                                              errorText: controller.errorConfirmPassword,
                                              focusNode: controller.confirmPasswordFocusNode,
                                              textInputAction: TextInputAction.done,
                                              textInputType: TextInputType.visiblePassword,
                                              secure: true,
                                              controller: controller.confirmPasswordController,
                                              validator: controller.confirmPasswordValidator,
                                              onSubmitted: (String? _) => controller.signUp()),
                                          AuthSubmitButton(title: AppLocalizations.of(context).registerNow, onPressed: controller.signUp)
                                        ])),
                                    Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            (MediaQuery.of(context).size.width >= 512)
                                                ? Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: childrenRGPD)
                                                : Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: childrenRGPD),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(margin: const EdgeInsets.only(right: 4), child: Text(AppLocalizations.of(context).alreadyHaveAccount)),
                                                TextButton(
                                                    style: ButtonStyle(shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                                                    onPressed: controller.navigateToSignIn,
                                                    child: Text(AppLocalizations.of(context).signIn, style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)))
                                              ],
                                            )
                                          ],
                                        ))
                                  ],
                                )))
                      ])))))
    ]));
  }
}
