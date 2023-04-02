import 'package:flutter_riverpod/flutter_riverpod.dart';

final readingTimeProvider = StateProvider<int>((ref) => 0);

final isRunningTimer = StateProvider<bool>((ref) => false);
