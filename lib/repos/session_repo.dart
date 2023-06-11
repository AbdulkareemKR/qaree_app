import 'package:Qaree/models/session/session.dart';
import 'package:Qaree/repos/firestore_repo.dart';
import 'package:Qaree/utils/status_logger/extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionRepo {
  // Providers
  static final getTodaySessionByUserIdProvider =
      StreamProvider.family<List<Session>, String>((ref, userId) {
    return getTodaySessionsByUserId(userId);
  });

  static final getWeeksSessionByUserIdProvider =
      StreamProvider.family<List<Session>, String>((ref, userId) {
    return getWeeksSessionsByUserId(userId);
  });

  // Functions
  static Future<Session?> addSession({required Session session}) async {
    try {
      await FirestoreRepo.sessionsCollection
          .doc(session.id)
          .set(session.toJson(), SetOptions(merge: true));
      return session;
    } catch (e) {
      e.logException();
      return null;
    }
  }

  static Stream<List<Session>> geSessionsByUserId(String userId) {
    try {
      final ordersStream = FirestoreRepo.sessionsCollection
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((list) =>
              list.docs.map((doc) => Session.fromJson(doc.data())).toList());
      return ordersStream;
    } catch (e) {
      e.logException();
      return const Stream.empty();
    }
  }

  static Stream<List<Session>> getTodaySessionsByUserId(String userId) {
    DateTime today = DateTime.now(); // get today's date and time
    DateTime startOfDay = DateTime(today.year, today.month,
        today.day); // set hour, minute, second, and millisecond to zero

    try {
      final ordersStream = FirestoreRepo.sessionsCollection
          .where('userId', isEqualTo: userId)
          .where('startDate', isGreaterThanOrEqualTo: startOfDay)
          .snapshots()
          .map((list) =>
              list.docs.map((doc) => Session.fromJson(doc.data())).toList());
      return ordersStream;
    } catch (e) {
      e.logException();
      return const Stream.empty();
    }
  }

  static Stream<List<Session>> getWeeksSessionsByUserId(String userId) {
    DateTime today = DateTime.now(); // get
    DateTime startOfDay = DateTime(today.year, today.month, today.day); //
    int currentDay = startOfDay.weekday;
    DateTime firstDayOfWeek = startOfDay
        .subtract(Duration(days: currentDay)); // get the first day of the week

    try {
      final ordersStream = FirestoreRepo.sessionsCollection
          .where('userId', isEqualTo: userId)
          .where('startDate', isGreaterThanOrEqualTo: firstDayOfWeek)
          .snapshots()
          .map((list) =>
              list.docs.map((doc) => Session.fromJson(doc.data())).toList());
      return ordersStream;
    } catch (e) {
      e.logException();
      return const Stream.empty();
    }
  }

  // static Stream<List<Session>> getUserSessionsFromDateToDate(
  //     {required String userId, DateTime? fromDate, DateTime? toDate}) {
  //   DateTime today = DateTime.now(); // get today's date and time
  //   DateTime startOfDay = fromDate ??
  //       DateTime(
  //           today.year,
  //           today.month,
  //           today
  //               .day); // if no date is provided, get the to get the start of the day

  //   DateTime endOfDay = toDate ??
  //       DateTime(today.year, today.month, today.day, 23,
  //           59); // to get the end of the day

  //   try {
  //     final ordersStream = FirestoreRepo.sessionsCollection
  //         .where('userId', isEqualTo: userId)
  //         .where('startDate', isGreaterThanOrEqualTo: startOfDay)
  //         .where('startDate', isLessThanOrEqualTo: endOfDay)
  //         .snapshots()
  //         .map((list) =>
  //             list.docs.map((doc) => Session.fromJson(doc.data())).toList());
  //     return ordersStream;
  //   } catch (e) {
  //     e.logException();
  //     return const Stream.empty();
  //   }
  // }
}
