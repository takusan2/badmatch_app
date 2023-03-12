import 'package:badmatch_app/constant/style.dart';
import 'package:flutter/material.dart';

class BadmintonCourt extends StatelessWidget {
  final double height;
  final String player1;
  final String player2;
  final String player3;
  final String player4;

  const BadmintonCourt({
    super.key,
    required this.height,
    required this.player1,
    required this.player2,
    required this.player3,
    required this.player4,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: height * 0.5 * 1.09,
          height: height * 0.5,
          decoration: BoxDecoration(
            color: const Color(0xFF79FE96),
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                player1,
                style: kPlayerTextStyle,
              ),
              Text(
                player2,
                style: kPlayerTextStyle,
              )
            ],
          ),
        ),
        Container(
          width: height * 0.5 * 1.09,
          height: height * 0.5,
          decoration: BoxDecoration(
            color: const Color(0xFF79FE96),
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                player3,
                style: kPlayerTextStyle,
              ),
              Text(
                player4,
                style: kPlayerTextStyle,
              )
            ],
          ),
        )
      ],
    );
  }
}
