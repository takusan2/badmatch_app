// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MatchPageState {
  ParticipantsModel? get participantsModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MatchPageStateCopyWith<MatchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchPageStateCopyWith<$Res> {
  factory $MatchPageStateCopyWith(
          MatchPageState value, $Res Function(MatchPageState) then) =
      _$MatchPageStateCopyWithImpl<$Res, MatchPageState>;
  @useResult
  $Res call({ParticipantsModel? participantsModel});
}

/// @nodoc
class _$MatchPageStateCopyWithImpl<$Res, $Val extends MatchPageState>
    implements $MatchPageStateCopyWith<$Res> {
  _$MatchPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantsModel = freezed,
  }) {
    return _then(_value.copyWith(
      participantsModel: freezed == participantsModel
          ? _value.participantsModel
          : participantsModel // ignore: cast_nullable_to_non_nullable
              as ParticipantsModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchPageStateCopyWith<$Res>
    implements $MatchPageStateCopyWith<$Res> {
  factory _$$_MatchPageStateCopyWith(
          _$_MatchPageState value, $Res Function(_$_MatchPageState) then) =
      __$$_MatchPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ParticipantsModel? participantsModel});
}

/// @nodoc
class __$$_MatchPageStateCopyWithImpl<$Res>
    extends _$MatchPageStateCopyWithImpl<$Res, _$_MatchPageState>
    implements _$$_MatchPageStateCopyWith<$Res> {
  __$$_MatchPageStateCopyWithImpl(
      _$_MatchPageState _value, $Res Function(_$_MatchPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantsModel = freezed,
  }) {
    return _then(_$_MatchPageState(
      participantsModel: freezed == participantsModel
          ? _value.participantsModel
          : participantsModel // ignore: cast_nullable_to_non_nullable
              as ParticipantsModel?,
    ));
  }
}

/// @nodoc

class _$_MatchPageState implements _MatchPageState {
  const _$_MatchPageState({this.participantsModel});

  @override
  final ParticipantsModel? participantsModel;

  @override
  String toString() {
    return 'MatchPageState(participantsModel: $participantsModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchPageState &&
            (identical(other.participantsModel, participantsModel) ||
                other.participantsModel == participantsModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, participantsModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchPageStateCopyWith<_$_MatchPageState> get copyWith =>
      __$$_MatchPageStateCopyWithImpl<_$_MatchPageState>(this, _$identity);
}

abstract class _MatchPageState implements MatchPageState {
  const factory _MatchPageState({final ParticipantsModel? participantsModel}) =
      _$_MatchPageState;

  @override
  ParticipantsModel? get participantsModel;
  @override
  @JsonKey(ignore: true)
  _$$_MatchPageStateCopyWith<_$_MatchPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
