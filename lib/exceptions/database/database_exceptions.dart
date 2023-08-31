import 'package:fumiko/exceptions/app_exceptions.dart';

class DatabaseExceptions {
  DatabaseExceptions._();

  static List<AppException> get databaseErrors => [permissionDenied(), unavailable(), disconnected(), unknown()];

  static AppException permissionDenied() => AppException(code: 'permission-denied', message: 'Database permission denied.');

  static AppException unavailable() => AppException(code: 'unavailable', message: 'Database is unavailable.');

  static AppException disconnected() => AppException(code: 'disconnected', message: 'Database is disconnected.');

  static AppException unknown() => AppException(code: 'unknown', message: 'Database unknown error.');
}
