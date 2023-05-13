import 'package:Qaree/features/statistics/controllers/statistics_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:Qaree/models/session/session.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MockSession extends Mock implements Session {}

class MockWidgetRef extends Mock implements WidgetRef {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late StatisticsController statisticsController;
  late List<Session> sessions;

  setUp(() {
    final mockBuildContext = MockBuildContext();
    final mockWidgetRef = MockWidgetRef();
    statisticsController =
        StatisticsController(context: mockBuildContext, ref: mockWidgetRef);

    sessions = [
      MockSession(),
      MockSession(),
      MockSession(),
    ];

    when(sessions[0].numberOfPages).thenReturn(5);
    when(sessions[0].totalReadingTime).thenReturn(100);
    when(sessions[1].numberOfPages).thenReturn(8);
    when(sessions[1].totalReadingTime).thenReturn(120);
    when(sessions[2].numberOfPages).thenReturn(4);
    when(sessions[2].totalReadingTime).thenReturn(80);
  });

  group('StatisticsController', () {
    test('getFormattedTotalReadingTime', () {
      final result =
          statisticsController.getFormattedTotalReadingTime(sessions);
      expect(result, equals('5m 0s')); // Updated expected value to '05:00'
    });

    test('getFormattedAverageReadingTime', () {
      final result =
          statisticsController.getFormattedAverageReadingTime(sessions);
      expect(result, equals('1m 40s')); // Updated expected value to '01:40'
    });

    test('getNumberOfPages', () {
      final result = statisticsController.getNumberOfPages(sessions);
      expect(result, equals(17));
    });

    test('getFormattedAverageTimePerPage', () {
      final result =
          statisticsController.getFormattedAverageTimePerPage(sessions);
      expect(result, equals('17s')); // Updated expected value to '00:00:17'
    });
  });
}
