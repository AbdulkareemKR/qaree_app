import 'package:sentry_flutter/sentry_flutter.dart';

class SentryService {
  static Future<void> captureException(
    dynamic exception, {
    dynamic stackTrace,
  }) async {
    await Sentry.captureException(
      exception,
      stackTrace: stackTrace,
    );
  }
}
