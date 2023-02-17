import 'dart:convert';
import 'dart:developer';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/services/polyline_result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionApi {
  static const String statusOk = "ok";
  String googleApiKey;
  LatLng origin;
  LatLng destination;
  bool avoidHighways;
  bool avoidTolls;
  bool avoidFerries;
  String language;

  DirectionApi({
    required this.googleApiKey,
    required this.origin,
    required this.destination,
    this.avoidHighways = false,
    this.avoidTolls = true,
    this.avoidFerries = true,
    this.language = "en",
  });

  Future<PolylineResult?> getRouteBetweenCoordinates() async {
    try {
      PolylineResult result = PolylineResult();
      final params = {
        "origin": "${origin.latitude},${origin.longitude}",
        "destination": "${destination.latitude},${destination.longitude}",
        "mode": "driving",
        "avoidHighways": "$avoidHighways",
        "avoidFerries": "$avoidFerries",
        "avoidTolls": "$avoidTolls",
        "key": googleApiKey,
        "language": language,
      };

      Uri uri =
          Uri.https("maps.googleapis.com", "maps/api/directions/json", params);
      log(uri.toString());
      List<LatLng> points = [];
      final response = await http.get(Uri.parse(uri.toString()));
      if (response.statusCode == 200) {
        final parsedJson = json.decode(response.body);
        result.apiCallStatus = parsedJson["status"];
        if (parsedJson["status"]?.toLowerCase() == statusOk &&
            parsedJson["routes"] != null &&
            parsedJson["routes"].isNotEmpty) {
          // decode google api polyline
          points = decodeEncodedPolyline(
              parsedJson["routes"][0]["overview_polyline"]["points"]);
          result.distance =
              parsedJson["routes"][0]["legs"][0]["distance"]["text"];
          result.duration =
              parsedJson["routes"][0]["legs"][0]["duration"]["text"];
          result.durationNum =
              parsedJson["routes"][0]["legs"][0]["duration"]["value"];
          log(result.distance);
          log(result.duration);
        } else {
          log("error in google direction api");
          result.errorMessage = parsedJson["errorMessage"];
          log(parsedJson["errorMessage"].toString());
        }
      }

      // convert direction to a set of polylines
      List<LatLng> polylineCoordinates = [];
      Map<PolylineId, Polyline> polylines = {};
      for (var point in points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      addPolyLine(List<LatLng> polylineCoordinates) {
        PolylineId id = const PolylineId("id");
        Polyline polyline = Polyline(
          polylineId: id,
          color: ColorsConst.infoBlue,
          points: polylineCoordinates,
          width: 5,
        );
        polylines[id] = polyline;
      }

      addPolyLine(polylineCoordinates);

      result.directionPolylines = Set<Polyline>.of(polylines.values);
      return result;
    } catch (e) {
      log(e.toString());

      return null;
    }
  }

  ///decode the google encoded string using Encoded Polyline Algorithm Format
  List<LatLng> decodeEncodedPolyline(String encoded) {
    List<LatLng> poly = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;
    final big0 = BigInt.from(0);
    final big0x1f = BigInt.from(0x1f);
    final big0x20 = BigInt.from(0x20);

    while (index < len) {
      int shift = 0;
      BigInt b, result;
      result = big0;
      do {
        b = BigInt.from(encoded.codeUnitAt(index++) - 63);
        result |= (b & big0x1f) << shift;
        shift += 5;
      } while (b >= big0x20);
      BigInt rshifted = result >> 1;
      int dlat;
      if (result.isOdd) {
        dlat = (~rshifted).toInt();
      } else {
        dlat = rshifted.toInt();
      }
      lat += dlat;

      shift = 0;
      result = big0;
      do {
        b = BigInt.from(encoded.codeUnitAt(index++) - 63);
        result |= (b & big0x1f) << shift;
        shift += 5;
      } while (b >= big0x20);
      rshifted = result >> 1;
      int dlng;
      if (result.isOdd) {
        dlng = (~rshifted).toInt();
      } else {
        dlng = rshifted.toInt();
      }
      lng += dlng;

      poly.add(LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble()));
    }
    return poly;
  }
}
