import 'package:Qaree/features/reading_session/controllers/reading_session_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Qaree/features/reading_session/controllers/reading_session_controller.dart';
import 'package:Qaree/features/reading_session/providers/reading_session_providers.dart';

void main() {
  group('ReadingSessionController', () {
    late ReadingSessionController controller;
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
      controller = ReadingSessionController(
        context: MaterialApp().createBuildContext(),
        ref: container.read,
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('onTimerButtonTap should start the timer when it is not active',
        () async {
      await controller.onTimerButtonTap();

      final isActive =
          container.read(ReadingSessionProviders.readingTimerProvider).isActive;

      expect(isActive, isTrue);
    });

    test('onTimerButtonTap should stop the timer when it is active', () async {
      await controller.onTimerButtonTap();
      await controller.onTimerButtonTap();

      final isActive =
          container.read(ReadingSessionProviders.readingTimerProvider).isActive;

      expect(isActive, isFalse);
    });

    test(
        'getTimerButtonText should return "Start" when the timer has not started',
        () {
      final text = controller.getTimerButtonText();

      expect(text, 'Start');
    });

    test(
        'getTimerButtonText should return "Resume" when the timer is not active but has already started',
        () async {
      await controller.onTimerButtonTap();
      await controller.onTimerButtonTap();

      final text = controller.getTimerButtonText();

      expect(text, 'Resume');
    });

    test('getTimerButtonText should return "Pause" when the timer is active',
        () async {
      await controller.onTimerButtonTap();

      final text = controller.getTimerButtonText();

      expect(text, 'Pause');
    });
  });
}
