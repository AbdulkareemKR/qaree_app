import 'package:Qaree/features/login/auth_reo.dart';
import 'package:Qaree/features/login/controllers/sign_up_screen_controller.dart';
import 'package:Qaree/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWidgetRef extends Mock implements WidgetRef {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  group('SignUpScreenController', () {
    late SignUpScreenController controller;
    late MockBuildContext mockContext;
    late MockWidgetRef mockRef;

    setUp(() {
      mockContext = MockBuildContext();
      mockRef = MockWidgetRef();
      controller = SignUpScreenController(context: mockContext, ref: mockRef);
    });

    test('signUp - valid input', () async {
      when(mockRef.read(authRepo))
          .thenReturn(MockAuthService() as FirebaseAuthServices);
      when(MockAuthService().createUserWithEmail(any, any))
          .thenAnswer((_) async => MockUser(uid: 'mock_uid'));
      when(ReaderRepo.createReader(
              id: anyNamed('id'),
              name: anyNamed('name'),
              email: anyNamed('email')))
          .thenAnswer((_) async => MockReader());

      controller.nameController.text = 'John Doe';
      controller.emailController.text = 'john.doe@example.com';
      controller.passwordController.text = 'password';

      await controller.signUp();

      verify(mockRef
          .read(authRepo)
          .createUserWithEmail('john.doe@example.com', 'password'));
      verify(ReaderRepo.createReader(
          id: 'mock_uid', name: 'John Doe', email: 'john.doe@example.com'));
    });

    test('signUp - empty input', () async {
      try {
        await controller.signUp();

        fail('Exception expected');
      } catch (e) {
        expect(e, isException);
        expect(e.toString(), 'Exception: Please fill all fields');
      }
    });
  });
}

class MockAuthService extends Mock implements AuthRepo {}

class MockUser extends Mock implements User {
  @override
  final String uid;

  MockUser({required this.uid});
}

class MockReader extends Mock implements Reader {}

class AuthRepo extends Mock {}

class ReaderRepo {
  static Future<Reader?> createReader(
      {required String id, required String name, required String email}) async {
    return Reader();
  }
}

class Reader {}

class User {
  final String uid;

  User({required this.uid});
}
