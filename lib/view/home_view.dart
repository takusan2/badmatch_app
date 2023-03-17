import 'package:badmatch_app/constant/string.dart';
import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/controller/community_controller.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/view/add_community_view.dart';
import 'package:badmatch_app/view/edit_community_view.dart';
import 'package:badmatch_app/view/member_view.dart';
import 'package:badmatch_app/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:widget_arrows/widget_arrows.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel vm = HomeViewModel();

  @override
  Widget build(BuildContext context) {
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
                  setState(() {
                    vm.editFlag = !vm.editFlag;
                  });
                },
                icon: vm.editFlag
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
                      child: const AddCommunityView(),
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
            stream: vm.watachCommunities(),
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
                                  vm.deleteCommunity(community);
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
                                      return MemberView(community: community);
                                    },
                                  ),
                                );
                              },
                              child: CommunityCard(
                                name: community.name,
                                trailing: !vm.editFlag
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
                                                  child: EditCommunityView(
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

class CommunityCard extends StatelessWidget {
  final String name;
  final Widget? trailing;
  final String? sideNote;

  const CommunityCard({
    super.key,
    required this.name,
    this.trailing,
    this.sideNote,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.centerLeft,
          constraints: const BoxConstraints(maxHeight: 50),
          decoration: const BoxDecoration(
            color: Color(0xFF454444),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxHeight: 60),
          decoration: const BoxDecoration(
            color: Color(0xFFFFD6D6),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: ListTile(
            trailing: trailing,
          ),
        ),
      ],
    );
  }
}
