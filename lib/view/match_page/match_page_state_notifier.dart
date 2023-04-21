import 'package:badmatch_app/business_logic/member_logic.dart';
import 'package:badmatch_app/controller/community_controller.dart';
import 'package:badmatch_app/model/participant.dart';
import 'package:badmatch_app/view/match_config_page/match_config_page_state.dart';
import 'package:badmatch_app/view/match_page/match_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class MatchPageStateNotifier extends StateNotifier<MatchPageState> {
  MatchPageStateNotifier() : super(const MatchPageState());

  Future<void> setParticipantsModel(BuildContext context) async {
    MatchConfigPageState config = context.read<MatchConfigPageState>();
    int communityId = context.read<CommunityController>().selectedCommunity.id;
    ParticipantsModel participantsModel = await context
        .read<MemberLogic>()
        .fetchParticipantModel(communityId,
            numCourt: config.numCourt,
            isSingle: config.isSingle,
            equalNumMatch: config.equalNumMatch,
            closeLevel: config.closeLevel);
    state = state.copyWith(participantsModel: participantsModel);
  }
}
