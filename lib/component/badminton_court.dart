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
    this.player1 = '',
    this.player2 = '',
    this.player3 = '',
    this.player4 = '',
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
              children: player2 != ''
                  ? [
                      Text(
                        player1,
                        textAlign: TextAlign.center,
                        style: kPlayerTextStyle,
                      ),
                      Text(
                        player2,
                        textAlign: TextAlign.center,
                        style: kPlayerTextStyle,
                      )
                    ]
                  : [
                      Text(
                        player1,
                        textAlign: TextAlign.center,
                        style: kPlayerTextStyle,
                      ),
                    ]),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: player4 != ''
                  ? [
                      Text(
                        player3,
                        textAlign: TextAlign.center,
                        style: kPlayerTextStyle,
                      ),
                      Text(
                        player4,
                        textAlign: TextAlign.center,
                        style: kPlayerTextStyle,
                      )
                    ]
                  : [
                      Text(
                        player3,
                        textAlign: TextAlign.center,
                        style: kPlayerTextStyle,
                      ),
                    ]),
        )
      ],
    );
  }
}
