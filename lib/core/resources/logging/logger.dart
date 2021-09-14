import '../../../core.dart';

void logInfo(String message) {
  logger.i(message);
}

void logDebug(String message) {
  logger.d(message);
}

void logWarning(String message) {
  logger.w(message);
}

void logError(String message, [dynamic error, StackTrace? stackTrace]) {
  logger.e(message, error, stackTrace);
}
