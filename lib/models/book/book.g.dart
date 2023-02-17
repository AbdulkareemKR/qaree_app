// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      id: json['id'] as String,
      name: json['name'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
      publishDate: DateTime.parse(json['publishDate'] as String),
      author:
          (json['author'] as List<dynamic>).map((e) => e as String).toList(),
      pages: json['pages'] as int?,
      isbn: json['isbn'] as String,
      image: json['image'] as String?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$BookGenreEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'publishDate': instance.publishDate.toIso8601String(),
      'author': instance.author,
      'pages': instance.pages,
      'isbn': instance.isbn,
      'image': instance.image,
      'reviews': instance.reviews,
      'genres': instance.genres?.map((e) => _$BookGenreEnumMap[e]!).toList(),
    };

const _$BookGenreEnumMap = {
  BookGenre.fiction: 'fiction',
  BookGenre.nonFiction: 'nonFiction',
  BookGenre.biography: 'biography',
  BookGenre.history: 'history',
  BookGenre.science: 'science',
  BookGenre.technology: 'technology',
  BookGenre.engineering: 'engineering',
  BookGenre.math: 'math',
  BookGenre.art: 'art',
  BookGenre.design: 'design',
  BookGenre.photography: 'photography',
  BookGenre.health: 'health',
  BookGenre.fitness: 'fitness',
  BookGenre.dieting: 'dieting',
  BookGenre.psychology: 'psychology',
  BookGenre.religion: 'religion',
  BookGenre.spirituality: 'spirituality',
  BookGenre.selfHelp: 'selfHelp',
  BookGenre.personalDevelopment: 'personalDevelopment',
  BookGenre.business: 'business',
  BookGenre.finance: 'finance',
  BookGenre.economics: 'economics',
  BookGenre.law: 'law',
  BookGenre.politics: 'politics',
  BookGenre.socialSciences: 'socialSciences',
  BookGenre.education: 'education',
  BookGenre.teaching: 'teaching',
  BookGenre.reference: 'reference',
  BookGenre.language: 'language',
  BookGenre.literature: 'literature',
  BookGenre.childrens: 'childrens',
  BookGenre.teens: 'teens',
  BookGenre.comics: 'comics',
  BookGenre.graphicNovels: 'graphicNovels',
  BookGenre.manga: 'manga',
  BookGenre.cookbooks: 'cookbooks',
  BookGenre.foodWine: 'foodWine',
  BookGenre.travel: 'travel',
  BookGenre.guides: 'guides',
  BookGenre.sports: 'sports',
  BookGenre.outdoors: 'outdoors',
  BookGenre.hobbies: 'hobbies',
  BookGenre.home: 'home',
  BookGenre.garden: 'garden',
  BookGenre.pets: 'pets',
  BookGenre.humor: 'humor',
  BookGenre.entertainment: 'entertainment',
  BookGenre.music: 'music',
  BookGenre.movies: 'movies',
  BookGenre.tv: 'tv',
  BookGenre.theater: 'theater',
  BookGenre.dance: 'dance',
  BookGenre.crafts: 'crafts',
  BookGenre.games: 'games',
  BookGenre.puzzles: 'puzzles',
  BookGenre.parenting: 'parenting',
  BookGenre.family: 'family',
  BookGenre.relationships: 'relationships',
  BookGenre.friendship: 'friendship',
  BookGenre.spiritu: 'spiritu',
};