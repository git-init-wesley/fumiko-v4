library core_user;

import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fumiko/exceptions/app_exceptions.dart';
import 'package:fumiko/utils/regexp.dart';

part './auth/core_user_auth.dart';

enum CoreUserStates { unload, load }

enum AuthenticationStates { connected, offline }

class CoreUser {
  CoreUser._();

  static final CoreUser _instance = CoreUser._();

  static CoreUser get instance => _instance;

  AuthenticationStates _authenticationState = AuthenticationStates.offline;

  bool get isAuthenticated => _authenticationState == AuthenticationStates.connected;

  set setAuthenticationState(AuthenticationStates value) => _authenticationState = value;

  CoreUserStates _state = CoreUserStates.unload;

  bool get isLoaded => _state == CoreUserStates.load;

  set setState(CoreUserStates value) => _state = value;

  //TODO
  //FumikoUser? _currentUser;
  //FumikoUser get currentUser => _currentUser ?? FumikoUser();

  //TODO
  Future<void> load() async {}

  //TODO
  Future<void> unload() async {}
}
