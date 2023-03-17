import 'dart:io';

import 'package:badmatch_app/constant/config.dart';
import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/view_model/add_member_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMemberView extends StatefulWidget {
  final Community community;
  const AddMemberView({super.key, required this.community});

  @override
  State<AddMemberView> createState() => _AddMemberViewState();
}

class _AddMemberViewState extends State<AddMemberView> {
  DropdownButton<int> androidDropdown({required AddMemberViewModel vm}) {
    List<DropdownMenuItem<int>> dropdownItems = kLevelList
        .map(
          (int value) => (DropdownMenuItem(
            value: value,
            child: Text(value.toString()),
          )),
        )
        .toList();

    return DropdownButton<int>(
      value: vm.level,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          vm.level = value!;
        });
      },
    );
  }

  CupertinoPicker iOSPicker({required AddMemberViewModel vm}) {
    List<Text> pickerItems =
        kLevelList.map((value) => Text('Lv.${value.toString()}')).toList();

    return CupertinoPicker(
      squeeze: 1.2,
      backgroundColor: Colors.white,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async {
        setState(() {
          vm.level = kLevelList[selectedIndex];
        });
      },
      children: pickerItems,
    );
  }

  AddMemberViewModel vm = AddMemberViewModel();

  @override
  Widget build(BuildContext context) {
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
                            vm.sex = SexEnum.male;
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
                            vm.sex = SexEnum.female;
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
                      ? iOSPicker(vm: vm)
                      : androidDropdown(vm: vm),
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
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
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(label: Text('年齢（任意）')),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      if (value != '') {
                        vm.age = int.parse(value);
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (vm.formKey.currentState!.validate()) {
                        await vm
                            .insertMember(widget.community)
                            .then((value) => Navigator.pop(context));
                      }
                    },
                    child: const Text('追加', style: kButtonTextStyle),
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
