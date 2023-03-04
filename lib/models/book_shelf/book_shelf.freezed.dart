// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_shelf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookShelf _$BookShelfFromJson(Map<String, dynamic> json) {
  return _BookShelf.fromJson(json);
}

/// @nodoc
mixin _$BookShelf {
  String get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  List<String>? get books => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookShelfCopyWith<BookShelf> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookShelfCopyWith<$Res> {
  factory $BookShelfCopyWith(BookShelf value, $Res Function(BookShelf) then) =
      _$BookShelfCopyWithImpl<$Res, BookShelf>;
  @useResult
  $Res call({String id, String? userId, List<String>? books});
}

/// @nodoc
class _$BookShelfCopyWithImpl<$Res, $Val extends BookShelf>
    implements $BookShelfCopyWith<$Res> {
  _$BookShelfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? books = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      books: freezed == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookShelfCopyWith<$Res> implements $BookShelfCopyWith<$Res> {
  factory _$$_BookShelfCopyWith(
          _$_BookShelf value, $Res Function(_$_BookShelf) then) =
      __$$_BookShelfCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? userId, List<String>? books});
}

/// @nodoc
class __$$_BookShelfCopyWithImpl<$Res>
    extends _$BookShelfCopyWithImpl<$Res, _$_BookShelf>
    implements _$$_BookShelfCopyWith<$Res> {
  __$$_BookShelfCopyWithImpl(
      _$_BookShelf _value, $Res Function(_$_BookShelf) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? books = freezed,
  }) {
    return _then(_$_BookShelf(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      books: freezed == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookShelf implements _BookShelf {
  _$_BookShelf({required this.id, this.userId, final List<String>? books})
      : _books = books;

  factory _$_BookShelf.fromJson(Map<String, dynamic> json) =>
      _$$_BookShelfFromJson(json);

  @override
  final String id;
  @override
  final String? userId;
  final List<String>? _books;
  @override
  List<String>? get books {
    final value = _books;
    if (value == null) return null;
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookShelf(id: $id, userId: $userId, books: $books)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookShelf &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookShelfCopyWith<_$_BookShelf> get copyWith =>
      __$$_BookShelfCopyWithImpl<_$_BookShelf>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookShelfToJson(
      this,
    );
  }
}

abstract class _BookShelf implements BookShelf {
  factory _BookShelf(
      {required final String id,
      final String? userId,
      final List<String>? books}) = _$_BookShelf;

  factory _BookShelf.fromJson(Map<String, dynamic> json) =
      _$_BookShelf.fromJson;

  @override
  String get id;
  @override
  String? get userId;
  @override
  List<String>? get books;
  @override
  @JsonKey(ignore: true)
  _$$_BookShelfCopyWith<_$_BookShelf> get copyWith =>
      throw _privateConstructorUsedError;
}
