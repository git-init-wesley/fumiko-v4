import 'package:flutter/material.dart';
import 'package:fumiko/router/services/router_services.dart';

mixin AuthNavigationController {
  RouterNavigationService get authNavigationService;

  //TODO: Back to really
  VoidCallback get navigateToRecoveryPassword => () async => authNavigationService.pushReplacementTo(RouterRoutes.authSignIn);

  VoidCallback get navigateToSignUp => () async => authNavigationService.pushReplacementTo(RouterRoutes.authSignUp);

  VoidCallback get navigateToSignIn => () async => authNavigationService.pushReplacementTo(RouterRoutes.authSignIn);
}
