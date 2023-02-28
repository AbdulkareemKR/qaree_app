import 'package:Qaree/models/reader/reader.dart';
import 'package:Qaree/repos/reader_repo.dart';
import 'package:Qaree/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final readerProvider = StreamProvider<Reader?>((ref) {
  return ref.watch(authStreamProvider).when(
        loading: () => Stream.value(null),
        error: ((error, stackTrace) => Stream.value(null)),
        data: (user) {
          if (user != null) {
            final readerStream = ReaderRepo.getReaderStream(user.uid);
            return readerStream;
          } else {
            return Stream.value(null);
          }
        },
      );
});

// final readerStateProvider = StateProvider<Reader?>((ref) {
//   return ref.watch(readerProvider).when(
//       data: (carOwner) => carOwner,
//       error: (error, stack) => null,
//       loading: () => null);
// });

final authStreamProvider =
    StreamProvider<User?>(((ref) => FirebaseAuthServices.authChange));
