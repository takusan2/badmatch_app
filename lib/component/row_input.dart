import 'package:flutter/material.dart';

class RowInput extends StatelessWidget {
  const RowInput({
    super.key,
    required this.title,
    required this.onChange,
    required this.submittable,
  });

  final String title;
  final bool submittable;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              title,
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            )),
        Expanded(
          flex: 3,
          child: TextField(
            maxLines: null,
            decoration: const InputDecoration(
              // hintText: submittable ? '団体名を入力してください' : '団体名は1文字以上でなければいけません。',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
            ),
            onChanged: onChange,
          ),
        )
      ],
    );
  }
}
