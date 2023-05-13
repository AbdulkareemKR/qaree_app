import 'package:flutter_riverpod/flutter_riverpod.dart';

final isGroupBookAddedProvider = StateProvider<bool>((ref) => false);

final currentGroupIdProvider = StateProvider<String>((ref) => "");
