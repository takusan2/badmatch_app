import 'package:flutter/material.dart';

class MatchResulePage extends StatelessWidget {
  const MatchResulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body: SafeArea(
        child: Transform.rotate(
          // angle: 90 * pi / 180,
          angle: 0,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('岡田'),
                          Text('富田'),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('岡田'),
                          Text('富田'),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
