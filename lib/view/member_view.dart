import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/model/advanced_member.dart';
import 'package:badmatch_app/view/add_member_page.dart';
import 'package:badmatch_app/view/edit_member_view.dart';
import 'package:badmatch_app/view/match_config_view.dart';
import 'package:badmatch_app/view_model/member_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MemberView extends StatefulWidget {
  final Community community;
  const MemberView({super.key, required this.community});
  @override
  State<MemberView> createState() => _MemberViewState();
}

class _MemberViewState extends State<MemberView> {
  final MemberViewModel vm = MemberViewModel();

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
              onPressed: () => setState(() => vm.editFlag = !vm.editFlag),
              icon: vm.editFlag
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
                  stream: vm.watchCommunityAdvancedMembers(community.id),
                  builder:
                      (context, AsyncSnapshot<List<AdvancedMember>> snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      List<AdvancedMember> advancedMemberList = snapshot.data!;
                      if (snapshot.data == null) {
                        return Container();
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: advancedMemberList.length,
                        itemBuilder: (context, index) {
                          AdvancedMember advancedMember =
                              advancedMemberList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 1.0,
                            ),
                            child: Slidable(
                              key: ObjectKey(advancedMember),
                              endActionPane: ActionPane(
                                extentRatio: 0.3,
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      vm.deleteMember(advancedMember.member);
                                    },
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Card(
                                elevation: 2,
                                color: advancedMember.sex == SexEnum.male
                                    ? Colors.blue.shade100
                                    : Colors.red.shade100,
                                child: vm.editFlag
                                    ? ListTile(
                                        title: Text(
                                          'Lv.${advancedMember.level.toString()}  ${advancedMember.name}',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                                FontAwesomeIcons.handshake),
                                            const SizedBox(width: 10),
                                            Text(advancedMember.numMatches
                                                .toString()),
                                            IconButton(
                                              icon: const Icon(Icons.edit),
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
                                                          member: advancedMember
                                                              .member,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    : CheckboxListTile(
                                        value: advancedMember.isParticipant,
                                        onChanged: (value) {
                                          vm.updateMemberIsParticipant(
                                            member: advancedMember.member,
                                            isParticipant: value!,
                                          );
                                        },
                                        title: Row(
                                          children: [
                                            Text(
                                                'Lv.${advancedMember.level.toString()}'),
                                            const SizedBox(width: 10),
                                            Text(
                                              advancedMember.name,
                                              overflow: TextOverflow.ellipsis,
                                            ),
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
                showDialog(
                  context: context,
                  builder: (context) {
                    return const MatchConfigView();
                  },
                );
              },
              child: const Text('試合設定をする'),
            )
          ],
        ),
      ),
    );
  }
}
