import 'package:badmatch_app/business_logic/member_logic.dart';
import 'package:badmatch_app/component/badminton_court.dart';
import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/model/advanced_member.dart';
import 'package:badmatch_app/model/participant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchPage extends StatelessWidget {
  final Community community;
  final int numCourt;
  final bool isSingle;
  final bool equalNumMatch;
  final bool closeLevel;

  const MatchPage({
    super.key,
    required this.community,
    required this.numCourt,
    required this.isSingle,
    required this.equalNumMatch,
    required this.closeLevel,
  });

  @override
  Widget build(BuildContext context) {
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
                      numCourt: numCourt,
                      isSingle: isSingle,
                      equalNumMatch: equalNumMatch,
                      closeLevel: closeLevel,
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
                              itemCount: playersList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Column(
                                    children: [
                                      Text('第${index + 1}コート'),
                                      const SizedBox(height: 10.0),
                                      isSingle
                                          ? BadmintonCourt(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              player1:
                                                  playersList[index][0].name,
                                              player3:
                                                  playersList[index][1].name,
                                            )
                                          : BadmintonCourt(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              player1:
                                                  playersList[index][0].name,
                                              player2:
                                                  playersList[index][1].name,
                                              player3:
                                                  playersList[index][2].name,
                                              player4:
                                                  playersList[index][3].name,
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
                            onPressed: () {}, child: const Text('次の組み合わせ'))
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
