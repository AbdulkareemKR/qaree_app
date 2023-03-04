// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry_identifiers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IndustryIdentifiers _$$_IndustryIdentifiersFromJson(
        Map<String, dynamic> json) =>
    _$_IndustryIdentifiers(
      bookIsbn: (json['bookIsbn'] as List<dynamic>)
          .map((e) => BookIsbn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_IndustryIdentifiersToJson(
        _$_IndustryIdentifiers instance) =>
    <String, dynamic>{
      'bookIsbn': instance.bookIsbn,
    };
