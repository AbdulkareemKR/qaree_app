import 'package:Qaree/models/start_end_date/start_end_date.dart';
import 'package:Qaree/models/user/education_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  factory Session({
    required String id,
    required String userId,
    required String bookId,
    required StartEndDate startEndDate,
    required int numberOfPages,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}