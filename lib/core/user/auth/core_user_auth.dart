part of core_user;

typedef CoreUserAuthCallback = Function(List<AppException> exceptions);

class CoreUserAuth {
  CoreUserAuth._();

  static Future<void> signIn({required String emailAddress, required String password, required CoreUserAuthCallback whenComplete}) async {
    List<AppException> exceptions = [];
    if (!RegExps.mail.hasMatch(emailAddress)) {
      exceptions.add(AppExceptions.malformedEmail(object: emailAddress));
    }
    if (!RegExps.password.hasMatch(password)) {
      exceptions.add(AppExceptions.malformedPassword(object: password));
    }
    if (exceptions.isNotEmpty) {
      whenComplete(exceptions);
      return;
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (error, stacktrace) {
      if (AppExceptions.errorsCode.contains(error.code)) {
        exceptions.add(AppExceptions.fromCode(code: error.code, object: error));
      } else {
        exceptions.add(AppExceptions.error(object: error, message: error.message));
      }
      if (!kReleaseMode) {
        developer.log(error.toString(), time: DateTime.now(), stackTrace: stacktrace);
      }
    } finally {
      whenComplete(exceptions);
    }
  }

  static Future<void> signUp(
      {required String emailAddress, required String username, required String password, required String passwordConfirmation, required CoreUserAuthCallback whenComplete}) async {
    List<AppException> exceptions = [];
    if (!RegExps.mail.hasMatch(emailAddress)) {
      exceptions.add(AppExceptions.malformedEmail(object: emailAddress));
    }
    if (!RegExps.username.hasMatch(username)) {
      exceptions.add(AppExceptions.malformedUsername(object: username));
    }
    if (!RegExps.password.hasMatch(password)) {
      exceptions.add(AppExceptions.malformedPassword(object: password));
    }
    if (password != passwordConfirmation) {
      exceptions.add(AppExceptions.passwordNotEqual(object: {'p1': password, 'p2': passwordConfirmation}));
    }
    if (exceptions.isNotEmpty) {
      whenComplete(exceptions);
      return;
    }

    try {
      DataSnapshot dataSnapshot = await FirebaseDatabase.instance.ref().child('users').orderByChild('username').equalTo(username).get();
      if (dataSnapshot.exists) {
        exceptions.add(AuthExceptions.usernameAlreadyTaken());
        whenComplete(exceptions);
        return;
      }
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailAddress, password: password);

      //TODO: SetUsername after SignUp
      //    await DatabaseUser.of(uid: userCredential.user!.uid).setUsername(username);
    } on FirebaseAuthException catch (error, stacktrace) {
      if (AppExceptions.errorsCode.contains(error.code)) {
        exceptions.add(AppExceptions.fromCode(code: error.code, object: error));
      } else {
        exceptions.add(AppExceptions.error(object: error, message: error.message));
      }
      if (!kReleaseMode) {
        developer.log(error.toString(), time: DateTime.now(), stackTrace: stacktrace);
      }
    } finally {
      whenComplete(exceptions);
    }
  }

  static Future<void> recovery({required String emailAddress, required CoreUserAuthCallback whenComplete}) async {
    List<AppException> exceptions = [];
    if (!RegExps.mail.hasMatch(emailAddress)) {
      exceptions.add(AppExceptions.malformedEmail(object: emailAddress));
    }
    if (exceptions.isNotEmpty) {
      whenComplete(exceptions);
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
    } on FirebaseAuthException catch (error, stacktrace) {
      if (AppExceptions.errorsCode.contains(error.code)) {
        exceptions.add(AppExceptions.fromCode(code: error.code, object: error));
      } else {
        exceptions.add(AppExceptions.error(object: error, message: error.message));
      }
      if (!kReleaseMode) {
        developer.log(error.toString(), time: DateTime.now(), stackTrace: stacktrace);
      }
    } finally {
      whenComplete(exceptions);
    }
  }
}
