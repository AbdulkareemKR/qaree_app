import 'package:Qaree/models/session/session.dart';
import 'package:Qaree/services/date_time_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsController {
  BuildContext context;
  WidgetRef ref;

  StatisticsController({
    required this.context,
    required this.ref,
  });

  String getFormattedTotalReadingTime(List<Session> sessions) {
    return DateTimeServices.LettersTimerFormatter(_totalReadingTime(sessions));
  }

  String getFormattedAverageReadingTime(List<Session> sessions) {
    return DateTimeServices.LettersTimerFormatter(
        _averageReadingTime(sessions));
  }

  int getNumberOfPages(List<Session> sessions) {
    int numberOfPages = 0;
    sessions.forEach((session) {
      numberOfPages += session.numberOfPages ?? 0;
    });
    return numberOfPages;
  }

  String getFormattedAverageTimePerPage(List<Session> sessions) {
    return DateTimeServices.LettersTimerFormatter(
      _getAverageTimePerPage(sessions),
    );
  }

  int _getAverageTimePerPage(List<Session> sessions) {
    if (getNumberOfPages(sessions) == 0) {
      return 0;
    }
    final averageTimePerPage =
        _totalReadingTime(sessions) / getNumberOfPages(sessions);

    return averageTimePerPage.floor();
  }

  int _totalReadingTime(List<Session> sessions) {
    int totalReadingTime = 0;
    sessions.forEach((session) {
      totalReadingTime += session.totalReadingTime ?? 0;
    });
    return totalReadingTime;
  }

  int _averageReadingTime(List<Session> sessions) {
    final averageReadingTime =
        _totalReadingTime(sessions) / (sessions.isEmpty ? 1 : sessions.length);
    return averageReadingTime.floor();
  }
}
