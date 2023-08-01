import 'package:badmatch_app/business_logic/member_logic.dart';
import 'package:badmatch_app/component/badminton_court.dart';
import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/model/advanced_member.dart';
import 'package:badmatch_app/model/participant.dart';
import 'package:badmatch_app/view/match_config_page/match_config_page_state.dart';
import 'package:badmatch_app/view/match_page/match_page_state.dart';
import 'package:badmatch_app/view/match_page/match_page_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchPage extends StatelessWidget {
  final Community community;

  const MatchPage({
    super.key,
    required this.community,
  });

  @override
  Widget build(BuildContext context) {
    MatchConfigPageState config = context.read<MatchConfigPageState>();
    MatchPageState state = context.watch<MatchPageState>();
    MatchPageStateNotifier stateNotifier =
        context.read<MatchPageStateNotifier>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
      ),
      backgroundColor: Colors.orange.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder(
                future: context.read<MemberLogic>().fetchParticipantModel(
                      community.id,
                      numCourt: config.numCourt,
                      isSingle: config.isSingle,
                      equalNumMatch: config.equalNumMatch,
                      closeLevel: config.closeLevel,
                    ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    ParticipantsModel participant = snapshot.data!;
                    List<List<AdvancedMember>> playersList =
                        participant.playersList;
                    List<AdvancedMember> remainMemberList =
                        participant.remainMemberList;
                    return Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  state.participantsModel?.playersList.length ??
                                      0,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Text('第${index + 1}コート'),
                                      const SizedBox(height: 10.0),
                                      config.isSingle
                                          ? BadmintonCourt(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              player1: state.participantsModel!
                                                  .playersList[index][0].name,
                                              player3: state.participantsModel!
                                                  .playersList[index][1].name,
                                            )
                                          : BadmintonCourt(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              player1: state.participantsModel!
                                                  .playersList[index][0].name,
                                              player2: state.participantsModel!
                                                  .playersList[index][1].name,
                                              player3: state.participantsModel!
                                                  .playersList[index][2].name,
                                              player4: state.participantsModel!
                                                  .playersList[index][3].name,
                                            ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        remainMemberList.isEmpty
                            ? const SizedBox(
                                height: 10.0,
                              )
                            : Container(
                                padding: const EdgeInsets.all(20.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Wrap(
                                  spacing: 10.0,
                                  children: remainMemberList
                                      .map((e) => Text(e.name))
                                      .toList(),
                                ),
                              ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              stateNotifier.setParticipantsModel(context);
                            },
                            child: const Text('次の組み合わせ'))
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
