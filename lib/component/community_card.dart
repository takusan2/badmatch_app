import 'package:flutter/material.dart';

class CommunityCard extends StatelessWidget {
  final String name;
  final Widget? trailing;
  final String? sideNote;

  const CommunityCard({
    super.key,
    required this.name,
    this.trailing,
    this.sideNote,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.centerLeft,
          constraints: const BoxConstraints(maxHeight: 50),
          decoration: const BoxDecoration(
            color: Color(0xFF454444),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(maxHeight: 60),
          decoration: const BoxDecoration(
            color: Color(0xFFFFD6D6),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: ListTile(
            trailing: trailing,
          ),
        ),
      ],
    );
  }
}
