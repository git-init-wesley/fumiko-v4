part of auth_recovery;

class _AuthRecoveryView extends State<AuthRecoveryPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => widget._createController(), child: Consumer<_AuthRecoveryController>(builder: (context, controller, child) => _buildWidget(context, controller, child)));
  }

  Widget _buildWidget(BuildContext context, _AuthRecoveryController controller, Widget? child) {
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
                                Text(AppLocalizations.of(context).recovery, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.displayMedium!.fontSize)),
                                Text(AppLocalizations.of(context).recoveryDescription, style: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.titleLarge!.fontSize))
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
                                              textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.emailAddress,
                                              secure: false,
                                              controller: controller.emailAddressController,
                                              validator: controller.emailAddressValidator,
                                              onSubmitted: (String? _) => controller.recovery()),
                                          AuthSubmitButton(title: AppLocalizations.of(context).recovery, onPressed: controller.recovery)
                                        ])),
                                    Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(margin: const EdgeInsets.only(right: 4), child: Text(AppLocalizations.of(context).rememberPassword)),
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
