import 'package:badmatch_app/business_logic/community_logic.dart';
import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCommunityPage extends StatefulWidget {
  final Community? community;
  const EditCommunityPage({super.key, this.community});

  @override
  State<EditCommunityPage> createState() => _EditCommunityPageState();
}

class _EditCommunityPageState extends State<EditCommunityPage> {
  String name = "";
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFF757575),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF454444),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: <Widget>[
                          const Expanded(
                            flex: 1,
                            child: Text(
                              '団体名',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 4,
                            child: TextFormField(
                              initialValue: widget.community?.name,
                              validator: (value) {
                                if (value == null || value == "") {
                                  return '1文字以上入力してください';
                                }
                                return null;
                              },
                              autofocus: true,
                              onChanged: (value) {
                                name = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: kButtonDecoration,
                child: FilledButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      if (widget.community == null) {
                        await context
                            .read<CommunityLogic>()
                            .insertCommunity(name)
                            .then((value) => Navigator.pop(context));
                      } else {
                        await context
                            .read<CommunityLogic>()
                            .updateCommunity(
                                id: widget.community!.id, name: name)
                            .then((value) => Navigator.pop(context));
                      }
                    }
                  },
                  child: const Text(
                    '完了',
                    style: kButtonTextStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
