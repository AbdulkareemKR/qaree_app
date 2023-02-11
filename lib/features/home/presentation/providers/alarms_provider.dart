import 'dart:convert';
import 'dart:developer';

import 'package:Naqaa/features/home/presentation/models/alrams/alarms.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final alarmDataProvider = FutureProvider<List<Alarms>?>((ref) async {
  var headers = {'Authorization': 'Basic ZW52Nzg1MzMwL0FrQXBwOkBAQVNEYXNkQEA='};
  var request = http.Request(
      'GET', Uri.parse('https://env785330.us.cumulocity.com/alarm/alarms'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final responseData = await response.stream.bytesToString();
    final jsonData = json.decode(responseData);

    final alarmsList = List<Alarms>.from(
        (jsonData["alarms"] as List<dynamic>).map<Alarms?>((x) {
      return Alarms.fromJson(x);
    }));
    return alarmsList;
  } else {
    log(response.reasonPhrase.toString());
  }
});

Stream<List<Alarms>?> alarmsStream(Ref ref) async* {
  while (true) {
    await Future.delayed(Duration(milliseconds: 500));

    var headers = {
      'Authorization': 'Basic ZW52Nzg1MzMwL0FrQXBwOkBAQVNEYXNkQEA='
    };
    var request = http.Request(
        'GET', Uri.parse('https://env785330.us.cumulocity.com/alarm/alarms'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final jsonData = json.decode(responseData);

      final alarmsList = List<Alarms>.from(
          (jsonData["alarms"] as List<dynamic>).map<Alarms?>((x) {
        return Alarms.fromJson(x);
      }));
      updateAcknowledge(alarmsList, ref);
      yield alarmsList;
    } else {
      log(response.reasonPhrase.toString());
    }
  }
}

final alarmsStreamProvider = StreamProvider<List<Alarms>?>((ref) {
  return alarmsStream(ref);
});

final acknowledgeProvider = StateProvider<int>((ref) => 0);

void updateAcknowledge(List<Alarms>? alarms, Ref ref) {
  ref.read(acknowledgeProvider.notifier).state += alarms
          ?.where((alarm) =>
              alarm.status == "ACKNOWLEDGED" &&
              DateTime.parse(alarm.time).difference(DateTime.now()).inDays == 0)
          .toList()
          .length ??
      0;
}

Future<void> acknowledgeAlarm(String alarmId) async {
  var headers = {
    'Authorization': 'Basic ZW52Nzg1MzMwL0FrQXBwOkBAQVNEYXNkQEA=',
    'Content-Type': 'application/vnd.com.nsn.cumulocity.alarm+json',
    'Accept': 'application/vnd.com.nsn.cumulocity.alarm+json'
  };
  var request = http.Request(
      'PUT',
      Uri.parse(
          'https://env785330.us.cumulocity.com/alarm/alarms/{{$alarmId}}'));
  request.body = json.encode({"status": "ACKNOWLEDGED"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

final totalCollectedTrashesProvider = StateProvider<int>((ref) => 0);
