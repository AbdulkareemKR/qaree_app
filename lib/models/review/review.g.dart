// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      bookId: json['bookId'] as String?,
      reviewContent: json['reviewContent'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      date: _dateFromJson(json['date'] as Timestamp),
      isPublic: json['isPublic'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bookId': instance.bookId,
      'reviewContent': instance.reviewContent,
      'rating': instance.rating,
      'date': instance.date?.toIso8601String(),
      'isPublic': instance.isPublic,
    };
