import 'package:Qaree/features/splash_screen/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:Qaree/features/login/screens/login_screen.dart';
import 'package:Qaree/features/navigation_bar/screens/navigation_bar.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/services/easy_navigator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:Qaree/features/login/screens/login_screen.dart';
import 'package:Qaree/features/navigation_bar/screens/navigation_bar.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:Qaree/utils/status_logger/status_logger.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockWidgetRef extends Mock implements WidgetRef {}

class MockEasyNavigator extends Mock implements EasyNavigator {}

class User {}

void main() {
  late SplashScreenController controller;
  late MockBuildContext mockContext;
  late MockWidgetRef mockRef;
  late MockEasyNavigator mockEasyNavigator;

  setUp(() {
    mockContext = MockBuildContext();
    mockRef = MockWidgetRef();
    mockEasyNavigator = MockEasyNavigator();
    controller = SplashScreenController(
      context: mockContext,
      ref: mockRef,
    );
    when(mockRef.read(userProvider)).thenReturn(null);
    when(mockEasyNavigator.openPage(
      context: anyNamed('context'),
      page: anyNamed('page'),
      isPushReplaced: anyNamed('isPushReplaced'),
    )).thenReturn(null);
    EasyNavigator.instance = mockEasyNavigator;
  });

  test(
      'checkInitialization should navigate to LoginScreen if userProvider is null',
      () {
    final snapshot =
        AsyncSnapshot<Object?>.withData(ConnectionState.done, null);

    controller.checkInitialization(snapshot: snapshot);

    verify(mockEasyNavigator.openPage(
      context: mockContext,
      page: anyNamed('page'),
      isPushReplaced: true,
    )).called(1);
    verify(mockEasyNavigator.openPage(
      context: mockContext,
      page: const LoginScreen(),
      isPushReplaced: true,
    )).called(1);
  });

  test(
      'checkInitialization should navigate to MainNavigationBar if userProvider is not null',
      () {
    when(mockRef.read(userProvider)).thenReturn(User());

    final snapshot =
        AsyncSnapshot<Object?>.withData(ConnectionState.done, null);

    controller.checkInitialization(snapshot: snapshot);

    verify(mockEasyNavigator.openPage(
      context: mockContext,
      page: anyNamed('page'),
      isPushReplaced: true,
    )).called(1);
    verify(mockEasyNavigator.openPage(
      context: mockContext,
      page: const MainNavigationBar(),
      isPushReplaced: true,
    )).called(1);
  });
}
