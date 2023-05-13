import 'package:Qaree/features/login/controllers/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWidgetRef extends Mock implements WidgetRef {}

void main() {
  group('LoginScreenController', () {
    late LoginScreenController controller;
    late MockWidgetRef ref;
    late BuildContext context;

    setUp(() {
      ref = MockWidgetRef();
      context = MockBuildContext();

      controller = LoginScreenController(
        context: context,
        ref: ref,
      );
    });

    test('login() with valid email and password should log in successfully',
        () async {
      when(ref.read(authRepo)).thenReturn(MockAuthRepo());
      when(ref.read(authRepo).singInWithEmail(any, any))
          .thenAnswer((_) async => MockUser(uid: '123'));

      controller.emailController.text = 'test@example.com';
      controller.passwordController.text = 'password';

      await controller.login();

      verify(ref.read(authRepo).singInWithEmail('test@example.com', 'password'))
          .called(1);
      verify(controller.context).log('Successfully logged in with UId: 123');
    });

    test('login() with empty email or password should throw an error',
        () async {
      controller.emailController.text = '';
      controller.passwordController.text = 'password';

      expect(controller.login(), throwsException);
    });

    test(
        'onLoginPressed() should navigate to the main navigation bar on successful login',
        () async {
      when(ref.read(authRepo)).thenReturn(MockAuthRepo());
      when(ref.read(authRepo).singInWithEmail(any, any))
          .thenAnswer((_) async => MockUser(uid: '123'));

      controller.emailController.text = 'test@example.com';
      controller.passwordController.text = 'password';

      await controller.onLoginPressed();

      verify(ref.read(authRepo).singInWithEmail('test@example.com', 'password'))
          .called(1);
      verify(controller.context)
          .openPage(page: MainNavigationBar(), isPushReplaced: true);
    });
  });
}

class MockAuthRepo extends Mock implements AuthRepo {}

class MockUser extends Mock implements User {}

class MockBuildContext extends Mock implements BuildContext {}
