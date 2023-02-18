import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepo {
  // firestore instance variable
  static final firestore = FirebaseFirestore.instance;

  // collections
  static final readersCollection = firestore.collection('Users');
  static final booksCollection = firestore.collection('Books');
  static final groupsCollection = firestore.collection('Groups');
  static final reviewsCollection = firestore.collection('reviews');
  static final bookShelvesCollection = firestore.collection('BookShelves');
}
