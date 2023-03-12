import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/view/add_member_page.dart';
import 'package:badmatch_app/view/edit_member_view.dart';
import 'package:badmatch_app/view/match_view.dart';
import 'package:badmatch_app/view_model/member_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MemberView extends StatefulWidget {
  final Community community;
  const MemberView({super.key, required this.community});
  @override
  State<MemberView> createState() => _MemberViewState();
}

class _MemberViewState extends State<MemberView> {
  final MemberViewModel vm = MemberViewModel();
  bool editFlag = false;

  @override
  Widget build(BuildContext context) {
    Community community = widget.community;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          community.name,
          style: const TextStyle(color: Colors.black),
        ),
        shape: kAppBarShape,
        backgroundColor: kAppBarColor,
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 20),
              onPressed: () => setState(() => editFlag = !editFlag),
              icon: editFlag
                  ? const Icon(
                      Icons.check,
                      color: Colors.lightBlue,
                    )
                  : const Icon(Icons.edit)),
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddMemberView(
                        community: community,
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.person_add,
              size: 35,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder(
                  stream: vm.watchCommunityMembers(community.id),
                  builder: (context, AsyncSnapshot<List<Member>> snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      List<Member> memberList = snapshot.data!;
                      if (snapshot.data == null) {
                        return Container();
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: memberList.length,
                        itemBuilder: (context, index) {
                          Member member = memberList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 1.0,
                            ),
                            child: Slidable(
                              endActionPane: ActionPane(
                                extentRatio: 0.3,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      vm.deleteMember(member);
                                    },
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              key: ObjectKey(member),
                              child: Card(
                                color: member.sex == SexEnum.male
                                    ? Colors.blue.shade100
                                    : Colors.red.shade100,
                                elevation: 2,
                                child: editFlag
                                    ? ListTile(
                                        title: Row(
                                          children: [
                                            Text(
                                                'Lv.${member.level.toString()}'),
                                            const SizedBox(width: 10),
                                            Text(member.name),
                                          ],
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  builder: (context) {
                                                    return SingleChildScrollView(
                                                      child: Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom),
                                                        child: EditMemberView(
                                                          member: member,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : CheckboxListTile(
                                        value: member.isParticipant,
                                        onChanged: (value) {
                                          vm.updateMemberIsParticipant(
                                            member: member,
                                            isParticipant: value!,
                                          );
                                        },
                                        title: Row(
                                          children: [
                                            Text(
                                                'Lv.${member.level.toString()}'),
                                            const SizedBox(width: 10),
                                            Text(member.name),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MatchView(
                        community: community,
                      ),
                    ),
                  );
                },
                child: const Text('試合を始める'))
          ],
        ),
      ),
    );
  }
}
