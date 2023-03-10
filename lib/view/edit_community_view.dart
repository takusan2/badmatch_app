import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/view_model/edit_community_view_model.dart';
import 'package:flutter/material.dart';

class EditCommunityView extends StatefulWidget {
  final Community community;
  const EditCommunityView({super.key, required this.community});

  @override
  State<EditCommunityView> createState() => _EditCommunityViewState();
}

class _EditCommunityViewState extends State<EditCommunityView> {
  EditCommunityViewModel vm = EditCommunityViewModel();
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
                  key: ObjectKey(widget.community),
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
                              initialValue: widget.community.name,
                              autofocus: true,
                              onChanged: (value) => vm.communityName = value,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        decoration: kButtonDecoration,
                        child: FilledButton(
                          onPressed: () async {
                            await vm
                                .updateCommunity(community: widget.community)
                                .then((_) => Navigator.pop(context));
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
            ],
          ),
        ),
      ),
    );
  }
}
