import 'package:Qaree/models/reader/reader.dart';
import 'package:Qaree/repos/firestore_repo.dart';
import 'package:Qaree/utils/status_logger/extensions.dart';
import 'package:Qaree/utils/status_logger/status_logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReaderRepo {
  static Future<Reader?> getUserById(String uid) async {
    final user = await FirestoreRepo.readersCollection
        .where('uid', isEqualTo: uid)
        .get();
    if (user.docs.isNotEmpty) {
      final reader = Reader.fromJson(user.docs.first.data());
      return reader;
    } else {
      return null;
    }
  }

  static Future<Reader?> createReader(
      {required String id, required String name, required String email}) async {
    final Reader reader = Reader(id: id, name: name, email: email);
    try {
      await FirestoreRepo.readersCollection
          .doc(id)
          .set(reader.toJson(), SetOptions(merge: true));
      return reader;
    } catch (e) {
      e.logException();
      return null;
    }
  }

  static Stream<Reader> getReaderStream(String uid,
      {bool ignoreDefaultCar = false}) {
    try {
      final user =
          FirestoreRepo.readersCollection.doc(uid).snapshots().map((doc) {
        try {
          final reader = Reader.fromJson(doc.data()!);
          return reader;
        } catch (e) {
          // Ensure that the user is logged out when any error is encountered

          StatusLogger.warning(
              "Logging out the current user with $uid because of an error in their data");
          FirebaseAuth.instance.signOut().ignore();

          e.logException();
          throw Exception(e);
        }
      });
      return user;
    } catch (e) {
      e.logException();
      throw Exception(e);
    }
  }
}
