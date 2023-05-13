import 'package:Qaree/models/review/review.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/repos/firestore_repo.dart';
import 'package:Qaree/utils/status_logger/extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewRepo {
  // Providers
  static final getReviewByBookIdProvider =
      StreamProvider.family<List<Review>, String>((ref, bookId) {
    return getReviewsByBookId(bookId);
  });

  static final getReviewByBookIdAndUserIdProvider =
      StreamProvider.family<Review?, String?>((ref, bookId) {
    final userId = ref.watch(readerProvider).whenData((user) => user.id);
    return getReviewByBookIdAndUserId(bookId, userId.asData?.value);
  });

  // Functions
  static Stream<List<Review>> getReviewsByBookId(String bookId) {
    try {
      final reviewsStream = FirestoreRepo.reviewsCollection
          .where('bookId', isEqualTo: bookId)
          .snapshots()
          .map((list) =>
              list.docs.map((doc) => Review.fromJson(doc.data())).toList());
      return reviewsStream;
    } catch (e) {
      e.logException();
      return const Stream.empty();
    }
  }

  static Future<Review?> updateReview({required Review review}) async {
    try {
      final querySnapshot = await FirestoreRepo.reviewsCollection
          .where("userId", isEqualTo: review.userId)
          .where("bookId", isEqualTo: review.bookId)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs[0].id;
        await FirestoreRepo.reviewsCollection.doc(docId).set(
            review.toJson(),
            SetOptions(
              merge: true,
            ));
        return review;
      } else {
        return addReview(review: review);
      }
    } catch (e) {
      e.logException();
      return null;
    }
  }

  static Future<Review?> addReview({required Review review}) async {
    try {
      await FirestoreRepo.reviewsCollection
          .doc(review.id)
          .set(review.toJson(), SetOptions(merge: true));
      return review;
    } catch (e) {
      e.logException();
      return null;
    }
  }

  static Stream<Review?> getReviewByBookIdAndUserId(
      String? bookId, String? userId) {
    try {
      final reviewsStream = FirestoreRepo.reviewsCollection
          .where('userId', isEqualTo: userId)
          .where('bookId', isEqualTo: bookId)
          .snapshots()
          .map((list) {
        final reviewsList =
            list.docs.map((doc) => Review.fromJson(doc.data())).toList();

        if (reviewsList.isNotEmpty) {
          return reviewsList.first;
        }
      });
      return reviewsStream;
    } catch (e) {
      e.logException();
      return const Stream.empty();
    }
  }
}
