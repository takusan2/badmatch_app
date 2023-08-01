import 'package:badmatch_app/model/advanced_member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_page_state.freezed.dart';

@freezed
class MemberPageState with _$MemberPageState {
  const factory MemberPageState({
    @Default(false) bool editFlag,
    @Default(null) List<AdvancedMember>? advancedMemberList,
  }) = _MemberPageState;
}
