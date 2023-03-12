import 'package:badmatch_app/component/badminton_court.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/view_model/mathc_view_model.dart';
import 'package:flutter/material.dart';

class MatchView extends StatelessWidget {
  final Community community;
  MatchView({
    super.key,
    required this.community,
  });
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
                future: vm.getPlayersList(community: community, numCourt: 2),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  } else {
                    List<List<Member>> playersList = snapshot.data!;
                    return SingleChildScrollView(
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
                              padding: const EdgeInsets.all(8.0),
                              child: BadmintonCourt(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                player1:
                                    '${playersList[index][0].name},${playersList[index][0].level}',
                                player2:
                                    '${playersList[index][1].name},${playersList[index][1].level}',
                                player3:
                                    '${playersList[index][2].name},${playersList[index][2].level}',
                                player4:
                                    '${playersList[index][3].name},${playersList[index][3].level}',
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: const Text('たくや'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
