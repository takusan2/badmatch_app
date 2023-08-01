import 'package:badmatch_app/controller/community_controller.dart';
import 'package:badmatch_app/view/match_config_page/match_config_page_state.dart';
import 'package:badmatch_app/view/match_config_page/match_config_page_state_notifier.dart';
import 'package:badmatch_app/view/match_page/match_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MatchConfigPage extends StatelessWidget {
  const MatchConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    MatchConfigPageState state = context.watch<MatchConfigPageState>();
    MatchConfigPageStateNotifier stateNotifier =
        context.read<MatchConfigPageStateNotifier>();
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
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text('コート数'), hintText: '1~20'),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onChanged: (value) {
                  if (value != '') {
                    stateNotifier.setNumCourt(int.parse(value));
                  }
                },
                validator: (value) {
                  if (value == null || value == '') {
                    return '1~20以下の数字を入力してください';
                  } else {
                    if (int.parse(value) > 20) {
                      return '20以下の数字を入力してください';
                    }

                    // if (int.parse(value) * (state.isSingle ? 2 : 4) >
                    //     vm.numParticipants) {
                    //   return '参加者に対してコート数が多いです';
                    // }
                  }
                  return null;
                },
              ),
              RadioListTile(
                title: const Text('シングルス'),
                value: true,
                groupValue: state.isSingle,
                onChanged: (value) {
                  stateNotifier.toggleIsSingle(toggleTo: true);
                },
              ),
              RadioListTile(
                title: const Text('ダブルス'),
                value: false,
                groupValue: state.isSingle,
                onChanged: (value) {
                  stateNotifier.toggleIsSingle(toggleTo: false);
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
                groupValue: state.equalNumMatch,
                onChanged: (value) {
                  stateNotifier.toggleEqualNumMatch();
                },
              ),
              RadioListTile(
                title: const Text('レベルが近いもの同士'),
                value: true,
                toggleable: true,
                groupValue: state.closeLevel,
                onChanged: (value) {
                  stateNotifier.toggleCloseLevel();
                },
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MatchPage(
                          community: Provider.of<CommunityController>(context,
                                  listen: false)
                              .selectedCommunity,
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
