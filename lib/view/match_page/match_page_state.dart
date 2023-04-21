import 'package:badmatch_app/model/participant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_page_state.freezed.dart';

@freezed
class MatchPageState with _$MatchPageState {
  const factory MatchPageState({
    ParticipantsModel? participantsModel,
  }) = _MatchPageState;
}
