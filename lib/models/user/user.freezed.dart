// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  EducationLevel get educationLevel => throw _privateConstructorUsedError;
  List<Group>? get groups => throw _privateConstructorUsedError;
  List<String>? get friendList => throw _privateConstructorUsedError;
  List<Note>? get notes => throw _privateConstructorUsedError;
  BookShelf? get bookShelf => throw _privateConstructorUsedError;
  List<Session>? get sessions => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      EducationLevel educationLevel,
      List<Group>? groups,
      List<String>? friendList,
      List<Note>? notes,
      BookShelf? bookShelf,
      List<Session>? sessions,
      double? latitude,
      double? longitude,
      String price,
      String size,
      String? image});

  $BookShelfCopyWith<$Res>? get bookShelf;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? educationLevel = null,
    Object? groups = freezed,
    Object? friendList = freezed,
    Object? notes = freezed,
    Object? bookShelf = freezed,
    Object? sessions = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? price = null,
    Object? size = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      educationLevel: null == educationLevel
          ? _value.educationLevel
          : educationLevel // ignore: cast_nullable_to_non_nullable
              as EducationLevel,
      groups: freezed == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
      friendList: freezed == friendList
          ? _value.friendList
          : friendList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      bookShelf: freezed == bookShelf
          ? _value.bookShelf
          : bookShelf // ignore: cast_nullable_to_non_nullable
              as BookShelf?,
      sessions: freezed == sessions
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookShelfCopyWith<$Res>? get bookShelf {
    if (_value.bookShelf == null) {
      return null;
    }

    return $BookShelfCopyWith<$Res>(_value.bookShelf!, (value) {
      return _then(_value.copyWith(bookShelf: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      EducationLevel educationLevel,
      List<Group>? groups,
      List<String>? friendList,
      List<Note>? notes,
      BookShelf? bookShelf,
      List<Session>? sessions,
      double? latitude,
      double? longitude,
      String price,
      String size,
      String? image});

  @override
  $BookShelfCopyWith<$Res>? get bookShelf;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? educationLevel = null,
    Object? groups = freezed,
    Object? friendList = freezed,
    Object? notes = freezed,
    Object? bookShelf = freezed,
    Object? sessions = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? price = null,
    Object? size = null,
    Object? image = freezed,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      educationLevel: null == educationLevel
          ? _value.educationLevel
          : educationLevel // ignore: cast_nullable_to_non_nullable
              as EducationLevel,
      groups: freezed == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
      friendList: freezed == friendList
          ? _value._friendList
          : friendList // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notes: freezed == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>?,
      bookShelf: freezed == bookShelf
          ? _value.bookShelf
          : bookShelf // ignore: cast_nullable_to_non_nullable
              as BookShelf?,
      sessions: freezed == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {required this.id,
      this.educationLevel = EducationLevel.none,
      final List<Group>? groups,
      final List<String>? friendList,
      final List<Note>? notes,
      this.bookShelf,
      final List<Session>? sessions,
      this.latitude,
      this.longitude,
      required this.price,
      required this.size,
      this.image})
      : _groups = groups,
        _friendList = friendList,
        _notes = notes,
        _sessions = sessions;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final EducationLevel educationLevel;
  final List<Group>? _groups;
  @override
  List<Group>? get groups {
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

  @override
  final BookShelf? bookShelf;
  final List<Session>? _sessions;
  @override
  List<Session>? get sessions {
    final value = _sessions;
    if (value == null) return null;
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String price;
  @override
  final String size;
  @override
  final String? image;

  @override
  String toString() {
    return 'User(id: $id, educationLevel: $educationLevel, groups: $groups, friendList: $friendList, notes: $notes, bookShelf: $bookShelf, sessions: $sessions, latitude: $latitude, longitude: $longitude, price: $price, size: $size, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.educationLevel, educationLevel) ||
                other.educationLevel == educationLevel) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality()
                .equals(other._friendList, _friendList) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.bookShelf, bookShelf) ||
                other.bookShelf == bookShelf) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      educationLevel,
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(_friendList),
      const DeepCollectionEquality().hash(_notes),
      bookShelf,
      const DeepCollectionEquality().hash(_sessions),
      latitude,
      longitude,
      price,
      size,
      image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {required final String id,
      final EducationLevel educationLevel,
      final List<Group>? groups,
      final List<String>? friendList,
      final List<Note>? notes,
      final BookShelf? bookShelf,
      final List<Session>? sessions,
      final double? latitude,
      final double? longitude,
      required final String price,
      required final String size,
      final String? image}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  @override
  EducationLevel get educationLevel;
  @override
  List<Group>? get groups;
  @override
  List<String>? get friendList;
  @override
  List<Note>? get notes;
  @override
  BookShelf? get bookShelf;
  @override
  List<Session>? get sessions;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String get price;
  @override
  String get size;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
