import 'package:badmatch_app/component/badminton_court.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/model/participant.dart';
import 'package:badmatch_app/view_model/mathc_view_model.dart';
import 'package:flutter/material.dart';

class MatchView extends StatefulWidget {
  final Community community;
  final int numCourt;
  final bool isSingle;
  final bool equalNumMatch;
  final bool closeLevel;

  const MatchView({
    super.key,
    required this.community,
    required this.numCourt,
    required this.isSingle,
    required this.equalNumMatch,
    required this.closeLevel,
  });

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  final MatchViewModel vm = MatchViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder(
                future: vm.getPlayersList(
                  community: widget.community,
                  numCourt: widget.numCourt,
                  isSingle: widget.isSingle,
                  equalNumMatch: widget.equalNumMatch,
                  closeLevel: widget.closeLevel,
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    Participant participant = snapshot.data!;
                    List playersList = participant.playersList;
                    List remainMembers = participant.remainMembers;
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
                                      horizontal: 8.0),
                                  child: Column(
                                    children: [
                                      Text('第${index + 1}コート'),
                                      const SizedBox(height: 10.0),
                                      widget.isSingle
                                          ? BadmintonCourt(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              player1:
                                                  '${playersList[index][0].name},${playersList[index][0].level}',
                                              player3:
                                                  '${playersList[index][1].name},${playersList[index][1].level}',
                                            )
                                          : BadmintonCourt(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              player1:
                                                  '${playersList[index][0].name},${playersList[index][0].level}',
                                              player2:
                                                  '${playersList[index][1].name},${playersList[index][1].level}',
                                              player3:
                                                  '${playersList[index][2].name},${playersList[index][2].level}',
                                              player4:
                                                  '${playersList[index][3].name},${playersList[index][3].level}',
                                            ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Row(
                            children:
                                remainMembers.map((e) => Text(e.name)).toList(),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {});
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
