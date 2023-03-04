// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reader _$ReaderFromJson(Map<String, dynamic> json) {
  return _Reader.fromJson(json);
}

/// @nodoc
mixin _$Reader {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  EducationLevel get educationLevel => throw _privateConstructorUsedError;
  List<String>? get groups => throw _privateConstructorUsedError;
  List<String>? get friendList => throw _privateConstructorUsedError;
  List<Note>? get notes => throw _privateConstructorUsedError;
  List<String>? get books => throw _privateConstructorUsedError;
  List<String>? get sessions => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReaderCopyWith<Reader> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReaderCopyWith<$Res> {
  factory $ReaderCopyWith(Reader value, $Res Function(Reader) then) =
      _$ReaderCopyWithImpl<$Res, Reader>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      EducationLevel educationLevel,
      List<String>? groups,
      List<String>? friendList,
      List<Note>? notes,
      List<String>? books,
      List<String>? sessions,
      String? imageUrl});
}

/// @nodoc
class _$ReaderCopyWithImpl<$Res, $Val extends Reader>
    implements $ReaderCopyWith<$Res> {
  _$ReaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? educationLevel = null,
    Object? groups = freezed,
    Object? friendList = freezed,
    Object? notes = freezed,
    Object? books = freezed,
    Object? sessions = freezed,
    Object? imageUrl = freezed,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      educationLevel: null == educationLevel
          ? _value.educationLevel
          : educationLevel // ignore: cast_nullable_to_non_nullable
              as EducationLevel,
      groups: freezed == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      friendList: freezed == friendList
          ? _value.friendList
          : friendList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      books: freezed == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sessions: freezed == sessions
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReaderCopyWith<$Res> implements $ReaderCopyWith<$Res> {
  factory _$$_ReaderCopyWith(_$_Reader value, $Res Function(_$_Reader) then) =
      __$$_ReaderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      EducationLevel educationLevel,
      List<String>? groups,
      List<String>? friendList,
      List<Note>? notes,
      List<String>? books,
      List<String>? sessions,
      String? imageUrl});
}

/// @nodoc
class __$$_ReaderCopyWithImpl<$Res>
    extends _$ReaderCopyWithImpl<$Res, _$_Reader>
    implements _$$_ReaderCopyWith<$Res> {
  __$$_ReaderCopyWithImpl(_$_Reader _value, $Res Function(_$_Reader) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? educationLevel = null,
    Object? groups = freezed,
    Object? friendList = freezed,
    Object? notes = freezed,
    Object? books = freezed,
    Object? sessions = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_Reader(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      educationLevel: null == educationLevel
          ? _value.educationLevel
          : educationLevel // ignore: cast_nullable_to_non_nullable
              as EducationLevel,
      groups: freezed == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      friendList: freezed == friendList
          ? _value._friendList
          : friendList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      books: freezed == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sessions: freezed == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reader implements _Reader {
  _$_Reader(
      {required this.id,
      required this.name,
      required this.email,
      this.educationLevel = EducationLevel.none,
      final List<String>? groups,
      final List<String>? friendList,
      final List<Note>? notes,
      final List<String>? books,
      final List<String>? sessions,
      this.imageUrl})
      : _groups = groups,
        _friendList = friendList,
        _notes = notes,
        _books = books,
        _sessions = sessions;

  factory _$_Reader.fromJson(Map<String, dynamic> json) =>
      _$$_ReaderFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  @JsonKey()
  final EducationLevel educationLevel;
  final List<String>? _groups;
  @override
  List<String>? get groups {
    final value = _groups;
    if (value == null) return null;
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _friendList;
  @override
  List<String>? get friendList {
    final value = _friendList;
    if (value == null) return null;
    if (_friendList is EqualUnmodifiableListView) return _friendList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Note>? _notes;
  @override
  List<Note>? get notes {
    final value = _notes;
    if (value == null) return null;
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _books;
  @override
  List<String>? get books {
    final value = _books;
    if (value == null) return null;
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _sessions;
  @override
  List<String>? get sessions {
    final value = _sessions;
    if (value == null) return null;
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'Reader(id: $id, name: $name, email: $email, educationLevel: $educationLevel, groups: $groups, friendList: $friendList, notes: $notes, books: $books, sessions: $sessions, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reader &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.educationLevel, educationLevel) ||
                other.educationLevel == educationLevel) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality()
                .equals(other._friendList, _friendList) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      educationLevel,
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_friendList),
      const DeepCollectionEquality().hash(_notes),
      const DeepCollectionEquality().hash(_books),
      const DeepCollectionEquality().hash(_sessions),
      imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReaderCopyWith<_$_Reader> get copyWith =>
      __$$_ReaderCopyWithImpl<_$_Reader>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReaderToJson(
      this,
    );
  }
}

abstract class _Reader implements Reader {
  factory _Reader(
      {required final String id,
      required final String name,
      required final String email,
      final EducationLevel educationLevel,
      final List<String>? groups,
      final List<String>? friendList,
      final List<Note>? notes,
      final List<String>? books,
      final List<String>? sessions,
      final String? imageUrl}) = _$_Reader;

  factory _Reader.fromJson(Map<String, dynamic> json) = _$_Reader.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  EducationLevel get educationLevel;
  @override
  List<String>? get groups;
  @override
  List<String>? get friendList;
  @override
  List<Note>? get notes;
  @override
  List<String>? get books;
  @override
  List<String>? get sessions;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ReaderCopyWith<_$_Reader> get copyWith =>
      throw _privateConstructorUsedError;
}
