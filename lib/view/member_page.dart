import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/view/add_member_page.dart';
import 'package:badmatch_app/view_model/member_page_view_model.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  final Community community;
  const MemberPage({super.key, required this.community});
  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final MemberPageViewModel vm = MemberPageViewModel();

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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddMemberPage(
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
          children: [
            StreamBuilder(
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
                        child: Card(
                          color: member.sex == SexEnum.male
                              ? Colors.blue.shade100
                              : Colors.red.shade100,
                          elevation: 2,
                          child: CheckboxListTile(
                            value: true,
                            onChanged: (value) {},
                            title: Row(
                              children: [
                                Text('Lv.${member.level.toString()}'),
                                const SizedBox(width: 10),
                                Text(member.name),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  await vm.insertMember(
                      name: '市川知愛',
                      level: 1,
                      sex: SexEnum.female,
                      communityId: community.id);
                },
                child: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
