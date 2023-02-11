import 'package:Naqaa/constants/colors_const.dart';
import 'package:Naqaa/features/home/presentation/models/alrams/alarms.dart';
import 'package:Naqaa/features/home/presentation/models/device_info/device_info.dart';
import 'package:Naqaa/services/google_map_direction.dart';
import 'package:Naqaa/services/polyline_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';

class HomeController {
  static Color getColorBasedOnSeverity(String severity) {
    switch (severity) {
      case "WARNING":
        return Colors.blue;
      case "MINOR":
        return ColorsConst.warningYellow;
      case "MAJOR":
        return Colors.orange;
      case "CRITICAL":
        return ColorsConst.redOne;
      default:
        return Colors.blue;
    }
  }

  static String getDateFormatFromString(String date, String format) {
    return DateFormat(format).format(DateTime.parse(date).toLocal());
  }

  static double getFullnessRatio(Alarms? alarm) {
    switch (alarm?.severity) {
      case "WARNING":
        return 0.25;
      case "MINOR":
        return 0.50;
      case "MAJOR":
        return 0.75;
      case "CRITICAL":
        return 1;
      default:
        return 0.25;
    }
  }

  static getTotalFullnessRatio(
      List<DeviceInfo>? devicesList, List<Alarms>? alarms) {
    double avgFullnessRatio = 0;
    int numberOfDevices = devicesList?.length ?? 0;
    int numberOfAlarms = alarms?.length ?? 0;

    if (numberOfDevices == 0) {
      return 0;
    } else if (numberOfAlarms == 0) {
      return .25;
    } else {
      devicesList!.forEach((device) {
        final latestAlarm =
            alarms!.firstWhereOrNull((alarm) => device.id == alarm.source.id);

        avgFullnessRatio += HomeController.getFullnessRatio(latestAlarm);
      });

      avgFullnessRatio = avgFullnessRatio / numberOfDevices;
    }
    return avgFullnessRatio;
  }
}
