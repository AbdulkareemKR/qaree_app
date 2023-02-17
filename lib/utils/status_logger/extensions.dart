import 'package:Qaree/utils/status_logger/status_logger.dart';

extension ExceptionLogger on Object {
  /// An easy way to log the exception.
  void logException({StackTrace? stackTrace}) {
    if (this is Error || this is Exception) {
      StatusLogger.error('$this', stackTrace: stackTrace);
    }
  }
}
