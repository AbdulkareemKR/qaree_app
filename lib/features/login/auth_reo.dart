import 'package:Qaree/services/auth_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepo = Provider<FirebaseAuthServices>(
  (ref) => FirebaseAuthServices(),
);
