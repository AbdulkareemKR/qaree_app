import 'package:Qaree/features/review/providers/review_providers.dart';
import 'package:Qaree/models/review/review.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/repos/review_repo.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewScreenController {
  BuildContext context;
  WidgetRef ref;

  ReviewScreenController({
    required this.context,
    required this.ref,
  });

  TextEditingController reviewTextController = TextEditingController();

  Future<void> onAddReviewPressed(String? bookId) async {
    final user = await ref.watch(readerProvider.future);

    final review = Review(
      bookId: bookId,
      userId: user.id,
      reviewContent: reviewTextController.text,
      rating: ref.read(ReviewProvider.bookRatingProvider),
      date: DateTime.now(),
    );

    await ReviewRepo.updateReview(review: review);

    EasyNavigator.popPage(context);
  }

  Future<Review?> getCurrentReview(String? bookId) async {
    final currentReview = await ref
        .read(ReviewRepo.getReviewByBookIdAndUserIdProvider(bookId).future);

    reviewTextController.text = currentReview?.reviewContent ?? "";
    ref.read(ReviewProvider.bookRatingProvider.notifier).state =
        currentReview?.rating?.toDouble() ?? 0.0;
    return currentReview;
  }
}
