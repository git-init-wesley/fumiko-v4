library core_user;

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:fumiko/database/user/database_user.dart';
import 'package:fumiko/entities/user/user.dart';
import 'package:fumiko/exceptions/app_exceptions.dart';
import 'package:fumiko/utils/change_listener.dart';
import 'package:fumiko/utils/regexp.dart';

part './auth/core_user_auth.dart';
part './presences/core_user_presences.dart';

enum CoreUserStates { unload, load }

enum AuthenticationStates { connected, offline }

class CoreUser {
  CoreUser._();

  static final CoreUser _instance = CoreUser._();

  static CoreUser get instance => _instance;

  AuthenticationStates _authenticationState = AuthenticationStates.offline;

  bool get isAuthenticated =>
      _authenticationState == AuthenticationStates.connected;

  set setAuthenticationState(AuthenticationStates value) =>
      _authenticationState = value;

  CoreUserStates _state = CoreUserStates.unload;

  bool get isLoaded => _state == CoreUserStates.load;

  set setState(CoreUserStates value) => _state = value;

  EntityUser? _current;

  EntityUser get current => _current ?? EntityUser();

  Future<void> unload({bool withLogout = true}) async {
    _state = CoreUserStates.unload;
    await _current?.destroy();
    _current = null;
    await CoreUserPresences.instance.destroyObserverCurrentUser();
    await CoreUserPresences.instance.destroyObserverOnlineUsers();
    if (withLogout) await FirebaseAuth.instance.signOut();
  }

  Future<void> load({required VoidCallback whenComplete}) async {
    await unload(withLogout: false);
    if (FirebaseAuth.instance.currentUser != null &&
        !isLoaded &&
        isAuthenticated) {
      _current = EntityUser.load(() async {
        _state = CoreUserStates.load;
        await CoreUserPresences.instance.observeCurrentUser();
        await CoreUserPresences.instance.observeOnlineUsers();
        whenComplete();
      });
    } else {
      whenComplete();
    }
  }
}
