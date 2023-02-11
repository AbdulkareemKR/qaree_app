import 'dart:convert';
import 'dart:developer';
import 'package:Naqaa/features/home/presentation/models/device_info/device_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final devicesInfoProvider = FutureProvider<List<DeviceInfo>?>((ref) async {
  var headers = {'Authorization': 'Basic ZW52Nzg1MzMwL0FrQXBwOkBAQVNEYXNkQEA='};
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://env785330.us.cumulocity.com/inventory/managedObjects?fragmentType=c8y_IsDevice'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final responseData = await response.stream.bytesToString();
    final jsonData = json.decode(responseData);

    final deviceInfoList = List<DeviceInfo>.from(
        (jsonData["managedObjects"] as List<dynamic>).map<DeviceInfo?>((x) {
      return DeviceInfo.fromJson(x);
    }));
    return deviceInfoList;
  } else {
    log(response.reasonPhrase.toString());
  }
});

Stream<List<DeviceInfo>?> devicesInfoStream() async* {
  while (true) {
    await Future.delayed(Duration(milliseconds: 500));

    var headers = {
      'Authorization': 'Basic ZW52Nzg1MzMwL0FrQXBwOkBAQVNEYXNkQEA='
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://env785330.us.cumulocity.com/inventory/managedObjects?fragmentType=c8y_IsDevice'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final jsonData = json.decode(responseData);

      final deviceInfoList = List<DeviceInfo>.from(
          (jsonData["managedObjects"] as List<dynamic>).map<DeviceInfo?>((x) {
        return DeviceInfo.fromJson(x);
      }));
      yield deviceInfoList;
    } else {
      log(response.reasonPhrase.toString());
    }
  }
}

final devicesInfoStreamProvider = StreamProvider<List<DeviceInfo>?>((ref) {
  return devicesInfoStream();
});
