part of app_exceptions;

class AuthExceptions {
  AuthExceptions._();

  static List<AppException> get authErrors => [
        userNotFound(),
        userDisabled(),
        tooManyRequests(),
        invalidEmail(),
        emailAlreadyInUse(),
        wrongPassword(),
        usernameAlreadyTaken()
      ];

  static AppException userNotFound() =>
      AppException(code: 'user-not-found', message: 'User not found.');

  static AppException userDisabled() =>
      AppException(code: 'user-disabled', message: 'User disabled.');

  static AppException tooManyRequests() => AppException(
      code: 'too-many-requests',
      message: 'The instance cannot be validated or is invalid.');

  static AppException invalidEmail() =>
      AppException(code: 'invalid-email', message: 'Invalid email address.');

  static AppException emailAlreadyInUse() => AppException(
      code: 'email-already-in-use', message: 'Email address already in use.');

  static AppException wrongPassword() =>
      AppException(code: 'wrong-password', message: 'Wrong password.');

  static AppException usernameAlreadyTaken() => AppException(
      code: 'username-already-taken', message: 'Username already taken.');
}
