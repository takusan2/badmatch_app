import 'package:badmatch_app/constant/config.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/view/match_result_page.dart';
import 'package:badmatch_app/view_model/member_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class MemberPage extends HookWidget {
  final Community community;
  const MemberPage({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    final MemberPageViewModel vm = useMemoized(() => MemberPageViewModel(), []);
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(title: Text(community.name)),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              const Text(
                'メンバー',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      StreamBuilder(
                        stream: vm.watchCommunityMembers(community.id),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (snapshot.data == null) {
                            return Container();
                          } else {
                            final List<Member> memberList = snapshot.data!;
                            return Form(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: memberList.length,
                                itemBuilder: (context, index) {
                                  final Member member = memberList[index];
                                  final TextEditingController controller =
                                      TextEditingController();
                                  controller.text = member.name;
                                  return MemberInput(
                                    member: member,
                                    controller: controller,
                                    index: index,
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 70.0,
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          scrollController.animateTo(
                            scrollController.position.maxScrollExtent,
                            duration: const Duration(seconds: 1),
                            curve: Curves.linear,
                          );
                          await Provider.of<MemberPageViewModel>(context,
                                  listen: false)
                              .insert(
                            name: '',
                            level: 1,
                            communityId: community.id,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Icon(Icons.add), Text('メンバーを追加')],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orange),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MatchResulePage(),
                    ),
                  );
                },
                child: const Text(
                  '試合を組む',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MemberInput extends StatelessWidget {
  const MemberInput({
    super.key,
    required this.member,
    required this.controller,
    required this.index,
  });

  final int index;
  final Member member;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(member),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("削除しました"),
              duration: Duration(seconds: 1),
            ),
          );
          await Provider.of<MemberPageViewModel>(
            context,
            listen: false,
          ).delete(member);
        }
        return false;
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.delete_sweep_rounded)),
      ),
      direction: DismissDirection.endToStart,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            (index + 1).toString(),
            style: const TextStyle(fontSize: 16),
          ),
          Checkbox(
            onChanged: (value) {},
            value: true,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            flex: 5,
            child: Focus(
              onFocusChange: (onFocus) async {
                if (!onFocus) {
                  await Provider.of<MemberPageViewModel>(
                    context,
                    listen: false,
                  ).updateName(
                    member: member,
                    name: controller.text,
                  );
                }
              },
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(labelText: '名前'),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 1,
            child: LevelDropdown(
              defaultValue: member.level,
              onChange: (level) async {
                await Provider.of<MemberPageViewModel>(
                  context,
                  listen: false,
                ).updateLevel(
                  member: member,
                  level: level!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LevelDropdown extends HookWidget {
  const LevelDropdown({
    super.key,
    required this.onChange,
    required this.defaultValue,
  });
  final void Function(int? value) onChange;
  final int defaultValue;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> dropdownValue = useState<int>(defaultValue);
    return Column(
      children: [
        const Text(
          'レベル',
          style: TextStyle(color: Colors.grey),
        ),
        DropdownButton<int>(
          value: dropdownValue.value,
          items: kLevelList
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text("$e"),
                  ))
              .toList(),
          onChanged: (value) {
            dropdownValue.value = value!;
            onChange(value);
          },
        ),
      ],
    );
  }
}
