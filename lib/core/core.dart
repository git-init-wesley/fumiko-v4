library core;

import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:fumiko/core/data/core_data.dart';
import 'package:fumiko/core/user/core_user.dart';
import 'package:fumiko/exceptions/app_exceptions.dart';
import 'package:fumiko/firebase/firebase_options.dart';
import 'package:fumiko/l10n/l10n.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

part './core_state.dart';

typedef StateCallback = Function(CoreStates newState);
typedef InitCallback = Function(
    AppException? exception, CoreData? data, bool isAuthenticated);

class Core {
  Core._();

  static final Core _instance = Core._();

  static Core get instance => _instance;

  FirebaseApp? _firebaseApp;

  FirebaseApp? get firebaseApp => _firebaseApp;

  SharedPreferences? _sharedPreferences;

  SharedPreferences? get sharedPreferences => _sharedPreferences;

  CoreStates _state = CoreStates.uninitialized;

  CoreStates get state => _state;

  CoreData? _data;

  CoreData? get data => _data;

  bool get isStartedInitialization => state != CoreStates.uninitialized;

  bool get isInitialized => state == CoreStates.initialized;

  Future<String> get currentLocale async =>
      Core.instance.sharedPreferences!.getString('fumiko-locale') ??
      ((await Core.instance.sharedPreferences!
              .setString('fumiko-locale', Intl.systemLocale))
          ? Intl.systemLocale
          : Intl.systemLocale);

  Future<void> init(
      {required StateCallback onStateChange,
      required InitCallback whenComplete}) async {
    _onStateChange(
        state: CoreStates.startInitialisation, onStateChange: onStateChange);
    _sharedPreferences = await SharedPreferences.getInstance();

    _onStateChange(
        state: CoreStates.initLanguage, onStateChange: onStateChange);
    await AppLocalizations.load(Locale(await currentLocale));

    _onStateChange(
        state: CoreStates.checkConnectivity, onStateChange: onStateChange);
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _onStateChange(
          state: CoreStates.uninitialized, onStateChange: onStateChange);
      whenComplete(AppExceptions.connectivityNone(), null, false);
      return;
    }
    if (connectivityResult == ConnectivityResult.vpn) {
      _onStateChange(
          state: CoreStates.uninitialized, onStateChange: onStateChange);
      whenComplete(AppExceptions.connectivityVPN(), null, false);
      return;
    }

    _onStateChange(
        state: CoreStates.initFirebase, onStateChange: onStateChange);
    try {
      _firebaseApp = await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
    } catch (error, stacktrace) {
      if (!kReleaseMode) {
        developer.log(error.toString(),
            time: DateTime.now(), stackTrace: stacktrace);
      }
      _onStateChange(
          state: CoreStates.uninitialized, onStateChange: onStateChange);
      whenComplete(AppExceptions.error(object: error), null, false);
      return;
    }

    _onStateChange(
        state: CoreStates.initFirebaseAppCheck, onStateChange: onStateChange);
    try {
      //TODO: AppCheck for Android and Apple providers
      await FirebaseAppCheck.instance.activate(
          webRecaptchaSiteKey: '6LdjWcMcAAAAAKnOP3gkuNNXp1upJPiOYbCO1GeZ');
    } catch (error, stacktrace) {
      if (error is FirebaseException && error.code != 'already-activated') {
        if (!kReleaseMode) {
          developer.log(error.toString(),
              time: DateTime.now(), stackTrace: stacktrace);
        }
        _onStateChange(
            state: CoreStates.uninitialized, onStateChange: onStateChange);
        whenComplete(AppExceptions.appInvalid(), null, false);
        return;
      }
    }

    _onStateChange(
        state: CoreStates.retrieveCoreData, onStateChange: onStateChange);

    try {
      Core.instance._data = CoreData.fromJson(jsonDecode(jsonEncode(
          (await FirebaseDatabase.instance.ref().child('core').get()))));
      FirebaseDatabase.instance.ref().child('core').onValue.listen((event) {
        Core.instance._data =
            CoreData.fromJson(jsonDecode(jsonEncode((event.snapshot.value))));
      });
    } catch (error, stacktrace) {
      if (!kReleaseMode) {
        developer.log(error.toString(),
            time: DateTime.now(), stackTrace: stacktrace);
      }
      _onStateChange(
          state: CoreStates.uninitialized, onStateChange: onStateChange);
      whenComplete(
          error is FirebaseException && error.code == "unknown"
              ? AppExceptions.appInvalid()
              : AppExceptions.error(object: error),
          null,
          false);
      return;
    }

    if (await data!.isUpdateAvailable || data!.isCurrentlyMaintenance) {
      _onStateChange(
          state: CoreStates.uninitialized, onStateChange: onStateChange);
      whenComplete(null, data, false);
      return;
    }

    FirebaseAuth.instance.authStateChanges().listen((User? user) async =>
        CoreUser.instance.setAuthenticationState = user != null
            ? AuthenticationStates.connected
            : AuthenticationStates.offline);
    _onStateChange(state: CoreStates.initialized, onStateChange: onStateChange);
    whenComplete(null, null, FirebaseAuth.instance.currentUser != null);
  }

  void _onStateChange(
      {required CoreStates state, required StateCallback onStateChange}) {
    _state = state;
    onStateChange.call(state);
  }
}
