import 'package:badmatch_app/constant/style.dart';
import 'package:badmatch_app/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';

class AddCommunityPage extends StatelessWidget {
  final HomePageViewModel vm;
  const AddCommunityPage({super.key, required this.vm});
  @override
  Widget build(BuildContext context) {
    String communityName = '';
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
                          child: TextField(
                            autofocus: true,
                            onChanged: (value) => communityName = value,
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
                              .insert(name: communityName)
                              .then((_) => Navigator.pop(context));
                        },
                        child: const Text(
                          '追加',
                          style: kButtonTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
