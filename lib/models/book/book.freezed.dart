// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  DateTime get publishDate => throw _privateConstructorUsedError;
  List<String> get author => throw _privateConstructorUsedError;
  int? get pages => throw _privateConstructorUsedError;
  String get isbn => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<Review>? get reviews => throw _privateConstructorUsedError;
  List<BookGenre>? get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String id,
      String name,
      double? rating,
      DateTime publishDate,
      List<String> author,
      int? pages,
      String isbn,
      String? image,
      List<Review>? reviews,
      List<BookGenre>? genres});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rating = freezed,
    Object? publishDate = null,
    Object? author = null,
    Object? pages = freezed,
    Object? isbn = null,
    Object? image = freezed,
    Object? reviews = freezed,
    Object? genres = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      publishDate: null == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<BookGenre>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$_BookCopyWith(_$_Book value, $Res Function(_$_Book) then) =
      __$$_BookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double? rating,
      DateTime publishDate,
      List<String> author,
      int? pages,
      String isbn,
      String? image,
      List<Review>? reviews,
      List<BookGenre>? genres});
}

/// @nodoc
class __$$_BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res, _$_Book>
    implements _$$_BookCopyWith<$Res> {
  __$$_BookCopyWithImpl(_$_Book _value, $Res Function(_$_Book) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rating = freezed,
    Object? publishDate = null,
    Object? author = null,
    Object? pages = freezed,
    Object? isbn = null,
    Object? image = freezed,
    Object? reviews = freezed,
    Object? genres = freezed,
  }) {
    return _then(_$_Book(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      publishDate: null == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      author: null == author
          ? _value._author
          : author // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pages: freezed == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int?,
      isbn: null == isbn
          ? _value.isbn
          : isbn // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<BookGenre>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Book implements _Book {
  _$_Book(
      {required this.id,
      required this.name,
      this.rating,
      required this.publishDate,
      required final List<String> author,
      this.pages,
      required this.isbn,
      this.image,
      final List<Review>? reviews,
      final List<BookGenre>? genres})
      : _author = author,
        _reviews = reviews,
        _genres = genres;

  factory _$_Book.fromJson(Map<String, dynamic> json) => _$$_BookFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double? rating;
  @override
  final DateTime publishDate;
  final List<String> _author;
  @override
  List<String> get author {
    if (_author is EqualUnmodifiableListView) return _author;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_author);
  }

  @override
  final int? pages;
  @override
  final String isbn;
  @override
  final String? image;
  final List<Review>? _reviews;
  @override
  List<Review>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BookGenre>? _genres;
  @override
  List<BookGenre>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Book(id: $id, name: $name, rating: $rating, publishDate: $publishDate, author: $author, pages: $pages, isbn: $isbn, image: $image, reviews: $reviews, genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Book &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.publishDate, publishDate) ||
                other.publishDate == publishDate) &&
            const DeepCollectionEquality().equals(other._author, _author) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.isbn, isbn) || other.isbn == isbn) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      rating,
      publishDate,
      const DeepCollectionEquality().hash(_author),
      pages,
      isbn,
      image,
      const DeepCollectionEquality().hash(_reviews),
      const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookCopyWith<_$_Book> get copyWith =>
      __$$_BookCopyWithImpl<_$_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  factory _Book(
      {required final String id,
      required final String name,
      final double? rating,
      required final DateTime publishDate,
      required final List<String> author,
      final int? pages,
      required final String isbn,
      final String? image,
      final List<Review>? reviews,
      final List<BookGenre>? genres}) = _$_Book;

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double? get rating;
  @override
  DateTime get publishDate;
  @override
  List<String> get author;
  @override
  int? get pages;
  @override
  String get isbn;
  @override
  String? get image;
  @override
  List<Review>? get reviews;
  @override
  List<BookGenre>? get genres;
  @override
  @JsonKey(ignore: true)
  _$$_BookCopyWith<_$_Book> get copyWith => throw _privateConstructorUsedError;
}
