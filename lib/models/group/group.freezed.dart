// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
mixin _$Group {
  List<Group>? get GroupAdmins => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get members => throw _privateConstructorUsedError;
  List<GroupBook>? get groupBooks => throw _privateConstructorUsedError;
  String? get groupLink => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res, Group>;
  @useResult
  $Res call(
      {List<Group>? GroupAdmins,
      String id,
      String? name,
      String? description,
      List<String>? members,
      List<GroupBook>? groupBooks,
      String? groupLink,
      String? image});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res, $Val extends Group>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? GroupAdmins = freezed,
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? members = freezed,
    Object? groupBooks = freezed,
    Object? groupLink = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      GroupAdmins: freezed == GroupAdmins
          ? _value.GroupAdmins
          : GroupAdmins // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      groupBooks: freezed == groupBooks
          ? _value.groupBooks
          : groupBooks // ignore: cast_nullable_to_non_nullable
              as List<GroupBook>?,
      groupLink: freezed == groupLink
          ? _value.groupLink
          : groupLink // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GroupCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$$_GroupCopyWith(_$_Group value, $Res Function(_$_Group) then) =
      __$$_GroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Group>? GroupAdmins,
      String id,
      String? name,
      String? description,
      List<String>? members,
      List<GroupBook>? groupBooks,
      String? groupLink,
      String? image});
}

/// @nodoc
class __$$_GroupCopyWithImpl<$Res> extends _$GroupCopyWithImpl<$Res, _$_Group>
    implements _$$_GroupCopyWith<$Res> {
  __$$_GroupCopyWithImpl(_$_Group _value, $Res Function(_$_Group) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? GroupAdmins = freezed,
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? members = freezed,
    Object? groupBooks = freezed,
    Object? groupLink = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_Group(
      GroupAdmins: freezed == GroupAdmins
          ? _value._GroupAdmins
          : GroupAdmins // ignore: cast_nullable_to_non_nullable
              as List<Group>?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      groupBooks: freezed == groupBooks
          ? _value._groupBooks
          : groupBooks // ignore: cast_nullable_to_non_nullable
              as List<GroupBook>?,
      groupLink: freezed == groupLink
          ? _value.groupLink
          : groupLink // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Group implements _Group {
  _$_Group(
      {final List<Group>? GroupAdmins,
      required this.id,
      this.name,
      this.description,
      final List<String>? members,
      final List<GroupBook>? groupBooks,
      this.groupLink,
      this.image})
      : _GroupAdmins = GroupAdmins,
        _members = members,
        _groupBooks = groupBooks;

  factory _$_Group.fromJson(Map<String, dynamic> json) =>
      _$$_GroupFromJson(json);

  final List<Group>? _GroupAdmins;
  @override
  List<Group>? get GroupAdmins {
    final value = _GroupAdmins;
    if (value == null) return null;
    if (_GroupAdmins is EqualUnmodifiableListView) return _GroupAdmins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? description;
  final List<String>? _members;
  @override
  List<String>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<GroupBook>? _groupBooks;
  @override
  List<GroupBook>? get groupBooks {
    final value = _groupBooks;
    if (value == null) return null;
    if (_groupBooks is EqualUnmodifiableListView) return _groupBooks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? groupLink;
  @override
  final String? image;

  @override
  String toString() {
    return 'Group(GroupAdmins: $GroupAdmins, id: $id, name: $name, description: $description, members: $members, groupBooks: $groupBooks, groupLink: $groupLink, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Group &&
            const DeepCollectionEquality()
                .equals(other._GroupAdmins, _GroupAdmins) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality()
                .equals(other._groupBooks, _groupBooks) &&
            (identical(other.groupLink, groupLink) ||
                other.groupLink == groupLink) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_GroupAdmins),
      id,
      name,
      description,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_groupBooks),
      groupLink,
      image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GroupCopyWith<_$_Group> get copyWith =>
      __$$_GroupCopyWithImpl<_$_Group>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupToJson(
      this,
    );
  }
}

abstract class _Group implements Group {
  factory _Group(
      {final List<Group>? GroupAdmins,
      required final String id,
      final String? name,
      final String? description,
      final List<String>? members,
      final List<GroupBook>? groupBooks,
      final String? groupLink,
      final String? image}) = _$_Group;

  factory _Group.fromJson(Map<String, dynamic> json) = _$_Group.fromJson;

  @override
  List<Group>? get GroupAdmins;
  @override
  String get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  List<String>? get members;
  @override
  List<GroupBook>? get groupBooks;
  @override
  String? get groupLink;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_GroupCopyWith<_$_Group> get copyWith =>
      throw _privateConstructorUsedError;
}
