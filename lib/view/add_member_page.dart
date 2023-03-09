import 'dart:io';

import 'package:badmatch_app/constant/config.dart';
import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/view_model/add_member_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMemberPage extends StatefulWidget {
  final Community community;
  const AddMemberPage({super.key, required this.community});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  SexEnum sex = SexEnum.male;
  int level = 1;
  String name = '';
  int? age;

  DropdownButton<int> androidDropdown() {
    List<DropdownMenuItem<int>> dropdownItems = kLevelList
        .map(
          (int value) => (DropdownMenuItem(
            value: value,
            child: Text(value.toString()),
          )),
        )
        .toList();

    return DropdownButton<int>(
      value: level,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          level = value!;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems =
        kLevelList.map((value) => Text('Lv.${value.toString()}')).toList();

    return CupertinoPicker(
      squeeze: 1.2,
      backgroundColor: Colors.white,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) async {
        level = kLevelList[selectedIndex];
      },
      children: pickerItems,
    );
  }

  final _formKey = GlobalKey<FormState>();

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
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text('男性'),
                        value: SexEnum.male,
                        groupValue: sex,
                        onChanged: (value) {
                          setState(() {
                            sex = SexEnum.male;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text('女性'),
                        value: SexEnum.female,
                        groupValue: sex,
                        onChanged: (value) {
                          setState(() {
                            sex = SexEnum.female;
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
                  child: Platform.isIOS ? iOSPicker() : androidDropdown(),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(label: Text('名前')),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '入力してください';
                    }
                    return null;
                  },
                  onChanged: (value) => name = value,
                ),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(label: Text('年齢（任意）')),
                    onChanged: (value) => age = int.parse(value)),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        await AddMemberPageViewModel().insert(
                          name: name,
                          sex: sex,
                          level: level,
                          age: age,
                          communityId: widget.community.id,
                        );
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
