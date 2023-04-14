import 'package:badmatch_app/controller/community_controller.dart';
import 'package:badmatch_app/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //これ入れないとダメだったと思います。
  await SystemChrome.setPreferredOrientations([
//許可する向きを指定する。
    DeviceOrientation.portraitUp, //上向きを許可
  ]);
  runApp(MultiProvider(
      providers: [Provider(create: (context) => CommunityController())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
