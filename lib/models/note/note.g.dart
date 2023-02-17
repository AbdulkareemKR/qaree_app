// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Note _$$_NoteFromJson(Map<String, dynamic> json) => _$_Note(
      id: json['id'] as String,
      userId: json['userId'] as String,
      bookId: json['bookId'] as String,
      noteContent: json['noteContent'] as String,
      date: DateTime.parse(json['date'] as String),
      isPublic: json['isPublic'] as bool? ?? false,
    );

Map<String, dynamic> _$$_NoteToJson(_$_Note instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bookId': instance.bookId,
      'noteContent': instance.noteContent,
      'date': instance.date.toIso8601String(),
      'isPublic': instance.isPublic,
    };
