// import 'package:Qaree/features/login/controllers/login_screen_controller.dart';
// import 'package:Qaree/features/login/screens/login_screen.dart';
// import 'package:Qaree/features/login/screens/sign_up_screen.dart';
// import 'package:Qaree/features/navigation_bar/screens/navigation_bar.dart';
// import 'package:Qaree/widgets/custom_textfield/custom_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mocktail/mocktail.dart';

// class MockNavigatorObserver extends Mock implements NavigatorObserver {}

// void main() {
//   late LoginScreenController controller;
//   final emailField = find.byType(CustomTextField).first;
//   final passwordField = find.byType(CustomTextField).last;
//   final loginButton = find.text('Login');
//   final signUpButton = find.text('Sign Up');

//   setUp(() {
//     controller = LoginScreenController(
//       context: MockBuildContext(),
//       ref: MockWidgetRef(),
//     );
//   });

//   testWidgets('Invalid email and password displays error message',
//       (WidgetTester tester) async {
//     await tester.pumpWidget(MaterialApp(home: LoginScreen()));
//     await tester.enterText(emailField, '');
//     await tester.enterText(passwordField, '');
//     await tester.tap(loginButton);
//     await tester.pump();

//     expect(find.text('Email or password is empty'), findsOneWidget);
//   });

//   testWidgets('Invalid email and password displays error message',
//       (WidgetTester tester) async {
//     when(() => controller.login()).thenAnswer((_) => null);
//     await tester.pumpWidget(MaterialApp(home: LoginScreen()));
//     await tester.enterText(emailField, 'example@gmail.com');
//     await tester.enterText(passwordField, 'password');
//     await tester.tap(loginButton);
//     await tester.pumpAndSettle();

//     verify(() => controller.login()).called(1);
//     expect(find.byType(MainNavigationBar), findsOneWidget);
//   });

//   testWidgets('Sign up button navigates to sign up screen',
//       (WidgetTester tester) async {
//     final mockObserver = MockNavigatorObserver();
//     await tester.pumpWidget(MaterialApp(
//       home: LoginScreen(),
//       navigatorObservers: [mockObserver],
//     ));
//     await tester.tap(signUpButton);
//     await tester.pumpAndSettle();

//     verify(() => mockObserver.didPush(any(), any())).called(1);
//     expect(find.byType(SignUpScreen), findsOneWidget);
//   });
// }
