import 'dart:async';
import 'dart:developer';
import 'package:Qaree/features/reading_session/providers/reading_session_providers.dart';
import 'package:Qaree/models/note/note.dart';
import 'package:Qaree/models/session/session.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/repos/reader_repo.dart';
import 'package:Qaree/repos/session_repo.dart';
import 'package:Qaree/services/date_time_services.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:ntp/ntp.dart';

class ReadingSessionController {
  BuildContext context;
  WidgetRef ref;

  ReadingSessionController({
    required this.context,
    required this.ref,
  });

  TextEditingController notesController = TextEditingController();

  /// This function is called when the timer button is tapped and updates the reading timer based on its current state.
  void onTimerButtonTap() async {
    // Obtain the current state of the reading timer from the provider.
    final readingTimer =
        ref.watch(ReadingSessionProviders.readingTimerProvider);

    // Obtain the current reading time in seconds from the provider.
    final readingTimeSeconds =
        ref.read(ReadingSessionProviders.readingTimeSecondsProvider);

    if (readingTimeSeconds == 0) {
      ref
          .read(ReadingSessionProviders.sessionStartTimeProvider.notifier)
          .state = DateTime.now();
    }

    // If the reading timer is currently active, stop it by setting its state to null.
    if (readingTimer?.isActive ?? false) {
      ref
          .read(ReadingSessionProviders.readingTimerProvider.notifier)
          .state
          ?.cancel();
      ref.read(ReadingSessionProviders.readingTimerProvider.notifier).state =
          null;
    }
    // If the reading timer is not currently active, start it by setting its state to a new Timer object.
    else {
      ref.read(ReadingSessionProviders.readingTimerProvider.notifier).state =
          Timer.periodic(Duration(seconds: 1), (timer) {
        // Increment the current reading time in seconds by 1 every second.
        ref
            .read(ReadingSessionProviders.readingTimeSecondsProvider.notifier)
            .state++;
      });
    }
  }

  Future<void> onStopTap(String bookId) async {
    final user = await ref.read(readerProvider.future);

    final newSession = Session(
      id: Uuid().v4(),
      startDate: ref.read(ReadingSessionProviders.sessionStartTimeProvider),
      endDate: DateTime.now(),
      bookId: bookId,
      userId: user.id,
      totalReadingTime:
          ref.read(ReadingSessionProviders.readingTimeSecondsProvider),
    );

    final addedSession = await SessionRepo.addSession(session: newSession);
    log(addedSession.toString());

    ref
        .read(ReadingSessionProviders.readingTimerProvider.notifier)
        .state
        ?.cancel();
    ref.read(ReadingSessionProviders.readingTimerProvider.notifier).state =
        null;

    ref
        .read(ReadingSessionProviders.readingTimeSecondsProvider.notifier)
        .state = 0;

    EasyNavigator.popPage(context);

    // InfoDialog.show(
    //     context: context, style: DialogStyle.success, message: "hello");
  }

  /// This function determines the text to display on a timer button based on the current state of a reading timer.
  String getTimerButtonText() {
    // Obtain the current state of the reading timer from the provider.
    final readingTimerStatus =
        ref.watch(ReadingSessionProviders.readingTimerProvider)?.isActive ??
            false;

    // Obtain the current reading time in seconds from the provider.
    final readingTimeSeconds =
        ref.read(ReadingSessionProviders.readingTimeSecondsProvider);

    // If the reading timer is currently active, return 'Pause'.
    if (readingTimerStatus) {
      return 'Pause';
    }
    // If the reading timer has not yet started, return 'Start'.
    else if (readingTimeSeconds == 0) {
      return 'Start';
    }
    // If the reading timer is not active but has already started, return 'Resume'.
    else {
      return 'Resume';
    }
  }

  void onCancelNotePressed() {
    ref.read(ReadingSessionProviders.isTakingNotesProvider.notifier).state =
        false;
  }

  void onTakeNotesPressed() {
    ref.read(ReadingSessionProviders.isTakingNotesProvider.notifier).state =
        true;
  }

  Future<void> onSaveNotePressed(String bookId) async {
    var uuid = Uuid();
    final user = await ref.read(readerProvider.future);

    final newNote = Note(
      id: uuid.v1(),
      noteContent: notesController.text,
      noteTitle: "Title",
      bookId: bookId,
      date: DateTime.now(),
      userId: user.id,
    );

    ReaderRepo.addNote(note: newNote);

    ref.read(ReadingSessionProviders.isTakingNotesProvider.notifier).state =
        false;
  }
}
