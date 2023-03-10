import 'dart:io';

import 'package:badmatch_app/constant/config.dart';
import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/view_model/edit_member_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditMemberView extends StatefulWidget {
  final Member member;
  const EditMemberView({super.key, required this.member});

  @override
  State<EditMemberView> createState() => _EditMemberViewState();
}

class _EditMemberViewState extends State<EditMemberView> {
  EditMemberViewModel vm = EditMemberViewModel();

  DropdownButton<int> androidDropdown({required int defaultLevel}) {
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
        vm.level = value!;
      },
    );
  }

  CupertinoPicker iOSPicker({required int defaultLevel}) {
    List<Text> pickerItems =
        kLevelList.map((value) => Text('Lv.${value.toString()}')).toList();

    return CupertinoPicker(
      scrollController:
          FixedExtentScrollController(initialItem: defaultLevel - 1),
      squeeze: 1.2,
      backgroundColor: Colors.white,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async {
        vm.level = kLevelList[selectedIndex];
      },
      children: pickerItems,
    );
  }

  @override
  void initState() {
    super.initState();
    vm.sex = widget.member.sex;
  }

  @override
  Widget build(BuildContext context) {
    Member member = widget.member;
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
            key: vm.formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text('男性'),
                        value: SexEnum.male,
                        groupValue: vm.sex,
                        onChanged: (value) {
                          setState(() {
                            vm.sex = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text('女性'),
                        value: SexEnum.female,
                        groupValue: vm.sex,
                        onChanged: (value) {
                          setState(() {
                            vm.sex = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 15.0,
                  ),
                  child: Platform.isIOS
                      ? iOSPicker(defaultLevel: member.level)
                      : androidDropdown(defaultLevel: member.level),
                ),
                TextFormField(
                  initialValue: member.name,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(label: Text('名前')),
                  onChanged: (value) => vm.name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '入力してください';
                    }
                    return null;
                  },
                ),
                TextFormField(
                    initialValue:
                        member.age != null ? member.age.toString() : '',
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(label: Text('年齢（任意）')),
                    onChanged: (value) => vm.age = int.parse(value)),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (vm.formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        await vm
                            .updateMember(member)
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
