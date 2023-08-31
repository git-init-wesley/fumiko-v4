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
}
