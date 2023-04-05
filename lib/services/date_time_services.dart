import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ntp/ntp.dart';
import 'package:intl/intl.dart';

class DateTimeServices {
  static Future<DateTime> getCurrentTime() async {
    // Get the current time from an NTP server
    DateTime currentTime = await NTP.now();

    // Return the current time
    return currentTime;
  }

  /// Takes an integer representing the total time in seconds and formats it into
  /// a string in the format of 'hh:mm:ss'.
  static String digitalTimerFormatter(int seconds) {
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

  static String LettersTimerFormatter(int seconds) {
    // Calculate the hours, minutes, and remaining seconds
    int hours = seconds ~/ 3600; // One hour is 3600 seconds
    int minutes = (seconds % 3600) ~/ 60; // One minute is 60 seconds
    int remainingSeconds = seconds % 60;

    // Create a list to store the formatted time parts
    List<String> timeParts = [];

    // Add the hours to the time parts list if there are any
    if (hours > 0) {
      timeParts.add('$hours' + 'h');
    }

    // Add the minutes to the time parts list if there are any
    if (minutes > 0) {
      timeParts.add('$minutes' + 'm');
    }

    // Add the remaining seconds to the time parts list
    timeParts.add('$remainingSeconds' + 's');

    // Join the time parts list into a single string with spaces between each part
    return timeParts.join(' ');
  }

  /// Get the hours from timestamp in the format i.e 3PM
  static String get12HoursAsString(
      {required DateTime dateTime, String? localCode = "en_US"}) {
    // Formate the timestamp based on the local code passed
    return DateFormat('j', localCode).format(dateTime);
  }

  static String getDayString(
      {required DateTime dateTime, String? localCode = "en_US"}) {
    return DateFormat('EEEE', localCode).format(dateTime);
  }

  static String getFullDateAsLetterMonth(
      {DateTime? dateTime, String? localCode = "en_US"}) {
    return dateTime == null ? "-" : DateFormat('yMMMd').format(dateTime);
  }

  static String getFullDateAsNumbers(
      {DateTime? dateTime, String? localCode = "en_US"}) {
    return dateTime == null ? "-" : DateFormat('yMd').format(dateTime);
  }
}
