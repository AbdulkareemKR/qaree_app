import 'package:Qaree/services/sentry_service.dart';
import 'package:logger/logger.dart';

class StatusLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true // Should each log print contain a timestamp
        ),
  );

  /// Log an error. The error will be logged to [Sentry] as well
  ///
  /// Args:
  ///   message (String): The message to be logged.
  ///   stackTrace (StackTrace): The stack trace of the error.
  static void error(String message, {StackTrace? stackTrace}) async {
    _logger.e(message);
    await SentryService.captureException(message, stackTrace: stackTrace);
  }

  /// Log useful information
  ///
  /// Args:
  ///   message (String): The message you would like to log.
  static void info(String message) {
    _logger.i(message);
  }

  /// Log for debugging (verbose)
  ///
  /// Args:
  ///   message (String): The message you would like to log.
  static void debug(String message) {
    _logger.v(message);
  }

  /// Log a warning
  ///
  /// Args:
  ///   message (String): The message you would like to log.
  static void warning(String message) {
    _logger.w(message);
  }
}
