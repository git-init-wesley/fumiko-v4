class AppException extends Error {
  final String _code;
  final String? _message;
  final Object? _object;

  String get code => _code;

  String? get message => _message;

  Object? get object => _object;

  void makeThrow() => throw this;

  AppException(
      {String code = 'error',
      String? message = 'An error has occurred.',
      Object? object})
      : _code = code,
        _message = message,
        _object = object;

  factory AppException.delta(
          {required AppException exceptionsService, Object? object}) =>
      AppException(
          code: exceptionsService.code,
          message: exceptionsService.message,
          object: exceptionsService.object ?? object);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppException &&
          runtimeType == other.runtimeType &&
          _code == other._code;

  @override
  int get hashCode => _code.hashCode;

  @override
  String toString() => object != null
      ? '$_message ($_code)\nFrom object: "$_object".'
      : '$_message ($_code)';
}

class AppExceptions {
  static List<AppException> get baseErrors => [
        error(),
        appInvalid(),
        connectivityNone(),
        connectivityVPN(),
        malformedEmail(),
        malformedUsername(),
        malformedPassword()
      ];

  static List<AppException> get errors => baseErrors;

  static List<String> get errorsCode => errors.map((e) => e.code).toList();

  static Map<String, AppException> get mapErrorsCode =>
      Map.fromIterables(errorsCode, errors);

  static AppException fromCode(String? code, Object? object) =>
      AppException.delta(
          exceptionsService: mapErrorsCode.entries
              .firstWhere((e) => e.value.code == code,
                  orElse: () =>
                      MapEntry<String, AppException>(error().code, error()))
              .value,
          object: object);

  static AppException error({String? message, Object? object}) =>
      AppException(object: object);

  static AppException appInvalid() => AppException(
      code: 'app/invalid',
      message: 'The instance cannot be validated or is invalid.');

  static AppException connectivityNone() => AppException(
      code: 'connectivity/none', message: 'No internet connection.');

  static AppException connectivityVPN() => AppException(
      code: 'connectivity/vpn', message: 'VPN internet connection.');

  static AppException malformedEmail({Object? object}) => AppException(
      code: 'malformed/email',
      message: 'The e-mail address is incorrectly formed.',
      object: object);

  static AppException malformedUsername({Object? object}) => AppException(
      code: 'malformed/username',
      message: 'The username is incorrectly formed.',
      object: object);

  static AppException malformedPassword({Object? object}) => AppException(
      code: 'malformed/password',
      message: 'The password address is incorrectly formed.',
      object: object);

  static bool isBaseErrors(AppException exceptionsService) =>
      baseErrors.contains(exceptionsService);
}