import 'package:badmatch_app/controller/community_controller.dart';
import 'package:badmatch_app/view/match_view.dart';
import 'package:badmatch_app/view_model/match_config_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MatchConfigView extends StatefulWidget {
  const MatchConfigView({super.key});

  @override
  State<MatchConfigView> createState() => _MatchConfigViewState();
}

class _MatchConfigViewState extends State<MatchConfigView> {
  MatchConfigViewModel vm = MatchConfigViewModel();

  @override
  void initState() {
    super.initState();
    Future(() async {
      await vm.setNumParticipants(
          Provider.of<CommunityController>(context, listen: false)
              .selectedCommunity);
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text('コート数'), hintText: '1~20'),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) {
                  if (value != '') {
                    vm.numCourt = int.parse(value);
                  }
                },
                validator: (value) {
                  if (value == null || value == '') {
                    return '1~20以下の数字を入力してください';
                  } else {
                    if (int.parse(value) > 20) {
                      return '20以下の数字を入力してください';
                    }

                    if (int.parse(value) * (vm.isSingle ? 2 : 4) >
                        vm.numParticipants) {
                      return '参加者に対してコート数が多いです';
                    }
                  }
                  return null;
                },
              ),
              RadioListTile(
                title: const Text('シングルス'),
                value: true,
                groupValue: vm.isSingle,
                onChanged: (value) {
                  setState(() {
                    vm.isSingle = true;
                  });
                },
              ),
              RadioListTile(
                title: const Text('ダブルス'),
                value: false,
                groupValue: vm.isSingle,
                onChanged: (value) {
                  setState(() {
                    vm.isSingle = false;
                  });
                },
              ),
              const Divider(
                height: 20.0,
                color: Colors.grey,
                thickness: 5.0,
              ),
              const Text('オプション'),
              RadioListTile(
                title: const Text('試合数平等'),
                value: true,
                toggleable: true,
                groupValue: vm.equalNumMatch,
                onChanged: (value) {
                  setState(() {
                    vm.equalNumMatch = !vm.equalNumMatch;
                  });
                },
              ),
              RadioListTile(
                title: const Text('レベルが近いもの同士'),
                value: true,
                toggleable: true,
                groupValue: vm.closeLevel,
                onChanged: (value) {
                  setState(() {
                    vm.closeLevel = !vm.closeLevel;
                  });
                },
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MatchView(
                          community: Provider.of<CommunityController>(context,
                                  listen: false)
                              .selectedCommunity,
                          numCourt: vm.numCourt,
                          isSingle: vm.isSingle,
                          equalNumMatch: vm.equalNumMatch,
                          closeLevel: vm.closeLevel,
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  '試合開始',
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
