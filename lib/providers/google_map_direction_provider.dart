import 'dart:developer';

import 'package:Naqaa/services/google_map_direction.dart';
import 'package:Naqaa/services/polyline_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

final googleMapDirectionResultProvider =
    FutureProvider.family<PolylineResult?, LatLng>((ref, destination) async {
  final userLocation = await getPosition();
  log(destination.toString());
  final directionResult = DirectionApi(
    origin: LatLng(userLocation.latitude, userLocation.longitude),
    destination: LatLng(destination.latitude, destination.longitude),
    googleApiKey: "AIzaSyCN2SVw8hopaNUgJC4-fh15Tgq1nVosCHw",
    language: "en",
  ).getRouteBetweenCoordinates();

  ref.read(googleMapDirectionResultStateProvider.notifier).state =
      await directionResult;
  return directionResult;
});

Future<Position> getPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  log("ssssss");
  return await Geolocator.getCurrentPosition();
}

final googleMapDirectionResultStateProvider =
    StateProvider<PolylineResult?>((ref) => null);

final googleMapDetailsVisibility = StateProvider<bool>((ref) => false);

Future<void> launchGoogleMap(LatLng destination) async {
  // TODO: make googleMapWervice model instead of accessing the attributes directly
  // for more information see this link https://github.com/GarageAppTeam/GaragePlatform/pull/289#discussion_r1020905818
  final destinationLocation = {
    "api": "1",
    "query": "${destination.latitude},${destination.longitude}"
  };
  try {
    final googleMapLaunchUri =
        Uri.https("www.google.com", "maps/search/", destinationLocation);

    if (await canLaunchUrl(googleMapLaunchUri)) {
      await launchUrl(googleMapLaunchUri);
    }
  } catch (e) {
    log(e.toString());
  }
}

final googleMapDestinationProvider = StateProvider<LatLng?>((ref) => null);
final alarmIdProvider = StateProvider<String?>((ref) => null);
