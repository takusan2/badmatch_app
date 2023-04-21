import 'dart:io';

import 'package:badmatch_app/business_logic/member_logic.dart';
import 'package:badmatch_app/constant/config.dart';
import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/controller/community_controller.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/view/edit_member_page/edit_member_page_state.dart';
import 'package:badmatch_app/view/edit_member_page/edit_member_page_state_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditMemberPage extends StatefulWidget {
  final Member? member;
  const EditMemberPage({super.key, this.member});

  @override
  State<EditMemberPage> createState() => _EditMemberPageState();
}

class _EditMemberPageState extends State<EditMemberPage> {
  DropdownButton<int> androidDropdown({
    int? defaultLevel,
    required void Function(int selectedLevel) onChanged,
  }) {
    List<DropdownMenuItem<int>> dropdownItems = kLevelList
        .map(
          (int value) => (DropdownMenuItem(
            value: value,
            child: Text(value.toString()),
          )),
        )
        .toList();

    return DropdownButton<int>(
      value: defaultLevel,
      items: dropdownItems,
      onChanged: (value) {
        onChanged(value!);
      },
    );
  }

  CupertinoPicker iOSPicker({
    int? defaultLevel,
    required void Function(int selectedLevel) onChanged,
  }) {
    List<Text> pickerItems =
        kLevelList.map((value) => Text('Lv.${value.toString()}')).toList();

    return CupertinoPicker(
      scrollController: FixedExtentScrollController(
          initialItem: defaultLevel != null ? defaultLevel - 1 : 0),
      squeeze: 1.2,
      backgroundColor: Colors.white,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async {
        int level = kLevelList[selectedIndex];
        onChanged(level);
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    EditMemberPageStateNotifier stateNotifier =
        context.read<EditMemberPageStateNotifier>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Container(
        color: const Color(0xFF757575),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Consumer(
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: const Text('男性'),
                            value: SexEnum.male,
                            groupValue:
                                context.select<EditMemberPageState, SexEnum>(
                                    (value) => value.sex),
                            onChanged: (value) {
                              stateNotifier.setSex(value!);
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: const Text('女性'),
                            value: SexEnum.female,
                            groupValue:
                                context.select<EditMemberPageState, SexEnum>(
                                    (value) => value.sex),
                            onChanged: (value) {
                              context
                                  .read<EditMemberPageStateNotifier>()
                                  .setSex(value!);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 15.0,
                  ),
                  child: Consumer(
                    builder: (context, value, child) {
                      return Platform.isIOS
                          ? iOSPicker(
                              defaultLevel: widget.member?.level,
                              onChanged: (selectedLevel) =>
                                  stateNotifier.setLevel(selectedLevel),
                            )
                          : androidDropdown(
                              defaultLevel: widget.member?.level,
                              onChanged: (selectedLevel) =>
                                  stateNotifier.setLevel(selectedLevel),
                            );
                    },
                  ),
                ),
                TextFormField(
                  initialValue: widget.member?.name,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(label: Text('名前')),
                  onChanged: (value) => stateNotifier.setName(value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '入力してください';
                    }
                    return null;
                  },
                ),
                TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    initialValue: widget.member?.age != null
                        ? widget.member?.age.toString()
                        : '',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(label: Text('年齢（任意）')),
                    onChanged: (value) =>
                        stateNotifier.setAge(int.parse(value))),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        widget.member != null
                            ? {
                                await context
                                    .read<MemberLogic>()
                                    .updateMember(widget.member!.copyWith(
                                      name: context
                                              .read<EditMemberPageState>()
                                              .name ??
                                          widget.member!.name,
                                      sex: context
                                          .read<EditMemberPageState>()
                                          .sex,
                                      level: context
                                              .read<EditMemberPageState>()
                                              .level ??
                                          widget.member!.level,
                                      age: context
                                              .read<EditMemberPageState>()
                                              .age ??
                                          widget.member!.age,
                                    ))
                                    .then((value) => Navigator.pop(context))
                              }
                            : context
                                .read<MemberLogic>()
                                .insertMember(MembersCompanion.insert(
                                  name:
                                      context.read<EditMemberPageState>().name!,
                                  sex: context.read<EditMemberPageState>().sex,
                                  age:
                                      context.read<EditMemberPageState>().age ??
                                          0,
                                  level: context
                                          .read<EditMemberPageState>()
                                          .level ??
                                      1,
                                  communityId: context
                                      .read<CommunityController>()
                                      .selectedCommunity
                                      .id,
                                ))
                                .then((value) => Navigator.pop(context));
                      }
                    },
                    child: const Text('完了', style: kButtonTextStyle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
