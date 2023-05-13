import 'package:Qaree/models/reader/reader.dart';
import 'package:Qaree/repos/reader_repo.dart';
import 'package:Qaree/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStreamProvider =
    StreamProvider<User?>(((ref) => FirebaseAuthServices.authChange));

/// This provider is responsible for the authentication state of the user.
final userProvider = StateProvider<User?>((ref) {
  return FirebaseAuth.instance.currentUser;
});

final readerProvider = StreamProvider<Reader>((ref) {
  return ReaderRepo.getReaderStream(ref.read(userProvider)?.uid);
});
