import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_config_page_state.freezed.dart';

@freezed
class MatchConfigPageState with _$MatchConfigPageState {
  factory MatchConfigPageState({
    @Default(1) final int numCourt,
    @Default(true) bool isSingle,
    @Default(true) bool equalNumMatch,
    @Default(true) bool closeLevel,
  }) = _MatchConfigPageState;
}
