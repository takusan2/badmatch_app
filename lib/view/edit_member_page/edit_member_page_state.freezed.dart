// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_member_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditMemberPageState {
  int? get level => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  SexEnum get sex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditMemberPageStateCopyWith<EditMemberPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMemberPageStateCopyWith<$Res> {
  factory $EditMemberPageStateCopyWith(
          EditMemberPageState value, $Res Function(EditMemberPageState) then) =
      _$EditMemberPageStateCopyWithImpl<$Res, EditMemberPageState>;
  @useResult
  $Res call({int? level, String? name, int? age, SexEnum sex});
}

/// @nodoc
class _$EditMemberPageStateCopyWithImpl<$Res, $Val extends EditMemberPageState>
    implements $EditMemberPageStateCopyWith<$Res> {
  _$EditMemberPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? sex = null,
  }) {
    return _then(_value.copyWith(
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as SexEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditMemberPageStateCopyWith<$Res>
    implements $EditMemberPageStateCopyWith<$Res> {
  factory _$$_EditMemberPageStateCopyWith(_$_EditMemberPageState value,
          $Res Function(_$_EditMemberPageState) then) =
      __$$_EditMemberPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? level, String? name, int? age, SexEnum sex});
}

/// @nodoc
class __$$_EditMemberPageStateCopyWithImpl<$Res>
    extends _$EditMemberPageStateCopyWithImpl<$Res, _$_EditMemberPageState>
    implements _$$_EditMemberPageStateCopyWith<$Res> {
  __$$_EditMemberPageStateCopyWithImpl(_$_EditMemberPageState _value,
      $Res Function(_$_EditMemberPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = freezed,
    Object? name = freezed,
    Object? age = freezed,
    Object? sex = null,
  }) {
    return _then(_$_EditMemberPageState(
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as SexEnum,
    ));
  }
}

/// @nodoc

class _$_EditMemberPageState implements _EditMemberPageState {
  const _$_EditMemberPageState(
      {this.level, this.name, this.age, this.sex = SexEnum.male});

  @override
  final int? level;
  @override
  final String? name;
  @override
  final int? age;
  @override
  @JsonKey()
  final SexEnum sex;

  @override
  String toString() {
    return 'EditMemberPageState(level: $level, name: $name, age: $age, sex: $sex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditMemberPageState &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.sex, sex) || other.sex == sex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, level, name, age, sex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditMemberPageStateCopyWith<_$_EditMemberPageState> get copyWith =>
      __$$_EditMemberPageStateCopyWithImpl<_$_EditMemberPageState>(
          this, _$identity);
}

abstract class _EditMemberPageState implements EditMemberPageState {
  const factory _EditMemberPageState(
      {final int? level,
      final String? name,
      final int? age,
      final SexEnum sex}) = _$_EditMemberPageState;

  @override
  int? get level;
  @override
  String? get name;
  @override
  int? get age;
  @override
  SexEnum get sex;
  @override
  @JsonKey(ignore: true)
  _$$_EditMemberPageStateCopyWith<_$_EditMemberPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
