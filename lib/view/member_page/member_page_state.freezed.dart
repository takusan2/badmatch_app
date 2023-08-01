// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MemberPageState {
  bool get editFlag => throw _privateConstructorUsedError;
  List<AdvancedMember>? get advancedMemberList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemberPageStateCopyWith<MemberPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberPageStateCopyWith<$Res> {
  factory $MemberPageStateCopyWith(
          MemberPageState value, $Res Function(MemberPageState) then) =
      _$MemberPageStateCopyWithImpl<$Res, MemberPageState>;
  @useResult
  $Res call({bool editFlag, List<AdvancedMember>? advancedMemberList});
}

/// @nodoc
class _$MemberPageStateCopyWithImpl<$Res, $Val extends MemberPageState>
    implements $MemberPageStateCopyWith<$Res> {
  _$MemberPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editFlag = null,
    Object? advancedMemberList = freezed,
  }) {
    return _then(_value.copyWith(
      editFlag: null == editFlag
          ? _value.editFlag
          : editFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      advancedMemberList: freezed == advancedMemberList
          ? _value.advancedMemberList
          : advancedMemberList // ignore: cast_nullable_to_non_nullable
              as List<AdvancedMember>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberPageStateCopyWith<$Res>
    implements $MemberPageStateCopyWith<$Res> {
  factory _$$_MemberPageStateCopyWith(
          _$_MemberPageState value, $Res Function(_$_MemberPageState) then) =
      __$$_MemberPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool editFlag, List<AdvancedMember>? advancedMemberList});
}

/// @nodoc
class __$$_MemberPageStateCopyWithImpl<$Res>
    extends _$MemberPageStateCopyWithImpl<$Res, _$_MemberPageState>
    implements _$$_MemberPageStateCopyWith<$Res> {
  __$$_MemberPageStateCopyWithImpl(
      _$_MemberPageState _value, $Res Function(_$_MemberPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? editFlag = null,
    Object? advancedMemberList = freezed,
  }) {
    return _then(_$_MemberPageState(
      editFlag: null == editFlag
          ? _value.editFlag
          : editFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      advancedMemberList: freezed == advancedMemberList
          ? _value._advancedMemberList
          : advancedMemberList // ignore: cast_nullable_to_non_nullable
              as List<AdvancedMember>?,
    ));
  }
}

/// @nodoc

class _$_MemberPageState implements _MemberPageState {
  const _$_MemberPageState(
      {this.editFlag = false,
      final List<AdvancedMember>? advancedMemberList = null})
      : _advancedMemberList = advancedMemberList;

  @override
  @JsonKey()
  final bool editFlag;
  final List<AdvancedMember>? _advancedMemberList;
  @override
  @JsonKey()
  List<AdvancedMember>? get advancedMemberList {
    final value = _advancedMemberList;
    if (value == null) return null;
    if (_advancedMemberList is EqualUnmodifiableListView)
      return _advancedMemberList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MemberPageState(editFlag: $editFlag, advancedMemberList: $advancedMemberList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberPageState &&
            (identical(other.editFlag, editFlag) ||
                other.editFlag == editFlag) &&
            const DeepCollectionEquality()
                .equals(other._advancedMemberList, _advancedMemberList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, editFlag,
      const DeepCollectionEquality().hash(_advancedMemberList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberPageStateCopyWith<_$_MemberPageState> get copyWith =>
      __$$_MemberPageStateCopyWithImpl<_$_MemberPageState>(this, _$identity);
}

abstract class _MemberPageState implements MemberPageState {
  const factory _MemberPageState(
      {final bool editFlag,
      final List<AdvancedMember>? advancedMemberList}) = _$_MemberPageState;

  @override
  bool get editFlag;
  @override
  List<AdvancedMember>? get advancedMemberList;
  @override
  @JsonKey(ignore: true)
  _$$_MemberPageStateCopyWith<_$_MemberPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
