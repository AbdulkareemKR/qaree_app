import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReadingSessionProviders {
  static final readingTimeSecondsProvider = StateProvider<int>((ref) => 0);

  static final readingTimerProvider = StateProvider<Timer?>((ref) => null);

  static final isTakingNotesProvider = StateProvider<bool>((ref) => false);

  static final sessionStartTimeProvider =
      StateProvider<DateTime?>((ref) => null);
}
