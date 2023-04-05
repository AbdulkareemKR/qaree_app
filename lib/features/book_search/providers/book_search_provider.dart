import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookSearchProvider {
  static final bookSearchQueryProvider = StateProvider<String>((ref) => '');
}
