import 'dart:async';
import 'dart:developer' as developer;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:fumiko/exceptions/app_exceptions.dart';

class DatabaseResult<V> {
  V? value;

  bool get success => error == null;
  AppException? error;

  DatabaseResult({this.value, this.error});
}

typedef DatabaseListen<V> = Function(V? value);

mixin Database {
  Future<DatabaseResult<V?>> getValue<V>({required String path}) async {
    try {
      return DatabaseResult(
          value: (await FirebaseDatabase.instance.ref().child(path).get()).value
              as V?);
    } catch (error, stacktrace) {
      if (!kReleaseMode) {
        developer.log(error.toString(),
            time: DateTime.now(), stackTrace: stacktrace);
      }
      return DatabaseResult(
          error: error is FirebaseException
              ? AppExceptions.fromCode(code: error.code, object: error)
              : AppExceptions.error(object: error));
    }
  }

  Future<DatabaseResult<V?>> setValue<V>(
      {required String path, required V? value}) async {
    try {
      await FirebaseDatabase.instance.ref().child(path).set(value);
      return DatabaseResult(value: value);
    } catch (error, stacktrace) {
      if (!kReleaseMode) {
        developer.log(error.toString(),
            time: DateTime.now(), stackTrace: stacktrace);
      }
      return DatabaseResult(
          error: error is FirebaseException
              ? AppExceptions.fromCode(code: error.code, object: error)
              : AppExceptions.error(object: error));
    }
  }

  Future<StreamSubscription> addObserver<V>(
          {required String path, required DatabaseListen<V?> listen}) async =>
      FirebaseDatabase.instance
          .ref()
          .child(path)
          .onValue
          .listen((event) => listen(event.snapshot.value as V?));

  static Future<void> removeObserver(
          {required StreamSubscription? streamSubscription}) async =>
      await streamSubscription?.cancel();
}
