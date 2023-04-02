import 'dart:async';

import 'package:Qaree/features/home/providers/home_screen_providers.dart';
import 'package:Qaree/features/home/screens/book_details_screen.dart';
import 'package:Qaree/features/reading_session/providers/reading_session_providers.dart';
import 'package:Qaree/features/reading_session/screens/reading_session_screen.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/note/note.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReadingSessionController {
  BuildContext context;
  WidgetRef ref;

  ReadingSessionController({
    required this.context,
    required this.ref,
  });

  void onBookTap(int bookIndex) {
    ref.read(selectedBookIndexProvider.notifier).state = bookIndex;
  }

  void onBookCardTap(Book book, List<Note>? notes) {
    EasyNavigator.openPage(
        context: context, page: BookDetailsScreen(book: book, notes: notes));
  }

  /// Takes an integer representing the total time in seconds and formats it into
  /// a string in the format of 'hh:mm:ss'.
  String formatTimer(int seconds) {
    // Calculate the number of hours in the given time
    int hours = seconds ~/ 3600;

    // Calculate the number of minutes in the remaining time
    int minutes = (seconds % 3600) ~/ 60;

    // Calculate the number of seconds in the remaining time
    int remainingSeconds = seconds % 60;

    // Convert the hours, minutes, and seconds to strings with two digits
    String twoDigitHours = hours.toString().padLeft(2, '0');
    String twoDigitMinutes = minutes.toString().padLeft(2, '0');
    String twoDigitSeconds = remainingSeconds.toString().padLeft(2, '0');

    // Combine the strings into the formatted timer string
    return '$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds';
  }

  void start() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      ref.read(readingTimeProvider.notifier).state++;
    });
  }
}
