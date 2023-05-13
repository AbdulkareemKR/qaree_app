import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewProvider {
  static final StateProvider<double> bookRatingProvider =
      StateProvider<double>((ref) => 0);
}
