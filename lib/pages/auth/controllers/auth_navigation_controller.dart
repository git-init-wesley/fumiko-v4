import 'package:flutter/material.dart';
import 'package:fumiko/router/services/router_services.dart';

mixin AuthNavigationController {
  RouterNavigationService get authNavigationService;

  VoidCallback get navigateToRecovery => () async => authNavigationService.pushReplacementTo(RouterRoutes.authRecovery);

  VoidCallback get navigateToSignUp => () async => authNavigationService.pushReplacementTo(RouterRoutes.authSignUp);

  VoidCallback get navigateToSignIn => () async => authNavigationService.pushReplacementTo(RouterRoutes.authSignIn);
}
