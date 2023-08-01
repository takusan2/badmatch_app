import 'package:badmatch_app/business_logic/member_logic.dart';
import 'package:badmatch_app/model/advanced_member.dart';
import 'package:badmatch_app/view/member_page/member_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class MemberPageStateNotifier extends StateNotifier<MemberPageState> {
  MemberPageStateNotifier() : super(const MemberPageState());

  void toggleEditFlag() {
    state = state.copyWith(editFlag: !state.editFlag);
  }

  Future<void> fetchAdvancedMembers(
    BuildContext context, {
    required int communityId,
  }) async {
    List<AdvancedMember> advancedMemberList = await context
        .read<MemberLogic>()
        .fetchAdvancedMembers(communityId: communityId);
    state = state.copyWith(advancedMemberList: advancedMemberList);
  }
}
