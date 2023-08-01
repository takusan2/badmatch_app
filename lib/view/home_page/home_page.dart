import 'package:badmatch_app/business_logic/community_logic.dart';
import 'package:badmatch_app/component/community_card.dart';
import 'package:badmatch_app/constant/string.dart';
import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/controller/community_controller.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/view/edit_community_page/edit_community_page.dart';
import 'package:badmatch_app/view/home_page/home_page_state.dart';
import 'package:badmatch_app/view/home_page/home_page_state_notifier.dart';
import 'package:badmatch_app/view/member_page/member_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:widget_arrows/widget_arrows.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    CommunityLogic communityLogic = context.read<CommunityLogic>();
    HomePageState state = context.watch<HomePageState>();
    HomePageStateNotifier stateNotifier = context.read<HomePageStateNotifier>();
    return ArrowContainer(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            appTitle,
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: () {
                  stateNotifier.toggleEditFlag();
                },
                icon: state.editFlag
                    ? const Icon(Icons.check, color: Colors.lightBlue)
                    : const Icon(Icons.edit),
              ),
            )
          ],
          backgroundColor: kAppBarColor,
          shape: kAppBarShape,
        ),
        floatingActionButton: ArrowElement(
          id: 'fab',
          show: true,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const EditCommunityPage(),
                    ),
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
        body: SafeArea(
          child: StreamBuilder<List<Community>>(
            stream: communityLogic.watchCommunities(),
            builder: (context, AsyncSnapshot<List<Community>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.data == null || (snapshot.data!).isEmpty) {
                  return const Center(
                    child: ArrowElement(
                        id: 'text',
                        show: true,
                        width: 2.0,
                        targetId: 'fab',
                        color: Colors.grey,
                        targetAnchor: Alignment.centerLeft,
                        sourceAnchor: Alignment.bottomCenter,
                        child: Text(
                          '団体を追加しよう！',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        )),
                  );
                } else {
                  List<Community> communityList = snapshot.data!;
                  return ListView.builder(
                    itemCount: communityList.length,
                    itemBuilder: (context, index) {
                      Community community = communityList[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Slidable(
                          endActionPane: ActionPane(
                            extentRatio: 0.3,
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  communityLogic.deleteCommunity(community.id);
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          key: ObjectKey(community),
                          child: Card(
                            elevation: 5,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Provider.of<CommunityController>(context,
                                        listen: false)
                                    .selectedCommunity = community;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MemberPage(community: community);
                                    },
                                  ),
                                );
                              },
                              child: CommunityCard(
                                name: community.name,
                                trailing: !state.editFlag
                                    ? null
                                    : IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) {
                                              return SingleChildScrollView(
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom,
                                                  ),
                                                  child: EditCommunityPage(
                                                    community: community,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
