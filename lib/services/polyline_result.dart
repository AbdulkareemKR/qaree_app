import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineResult {
  String? apiCallStatus;
  Set<Polyline> directionPolylines;
  String? errorMessage;
  String duration;
  String distance;
  int durationNum;

  PolylineResult({
    this.directionPolylines = const {},
    this.duration = "",
    this.distance = "",
    this.apiCallStatus,
    this.errorMessage = "",
    this.durationNum = 0,
  });
}
