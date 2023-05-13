import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedBookIndexProvider = StateProvider.autoDispose<int>((ref) => 0);
