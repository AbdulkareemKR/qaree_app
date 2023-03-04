// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_shelf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookShelf _$$_BookShelfFromJson(Map<String, dynamic> json) => _$_BookShelf(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      books:
          (json['books'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_BookShelfToJson(_$_BookShelf instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'books': instance.books,
    };
