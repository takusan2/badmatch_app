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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: <Widget>[
                const Expanded(
                  flex: 1,
                  child: Text(
                    '団体名',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: TextField(
                    autofocus: true,
                    onChanged: (value) => communityName = value,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: kBoxDecoration,
              child: TextButton(
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
    );
  }
}
