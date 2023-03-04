// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      pages: json['pages'] as int?,
      publisher: json['publisher'] as String?,
      isbn: (json['isbn'] as List<dynamic>?)?.map((e) => e as String).toList(),
      image: json['image'] as String?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookType: json['bookType'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'rating': instance.rating,
      'publishDate': instance.publishDate?.toIso8601String(),
      'authors': instance.authors,
      'pages': instance.pages,
      'publisher': instance.publisher,
      'isbn': instance.isbn,
      'image': instance.image,
      'reviews': instance.reviews,
      'bookType': instance.bookType,
      'genres': instance.genres,
      'language': instance.language,
    };
