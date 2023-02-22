import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/view/home_page.dart';
import 'package:badmatch_app/view_model/add_community_page_view_model.dart';
import 'package:badmatch_app/view_model/home_page_view_model.dart';
import 'package:badmatch_app/view_model/member_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late MyDatabase database;

void main() async {
  database = MyDatabase();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageViewModel>(
          create: (context) => HomePageViewModel(database: database),
        ),
        ChangeNotifierProvider<AddCommunityPageViewModel>(
          create: (context) => AddCommunityPageViewModel(database: database),
        ),
        ChangeNotifierProvider<MemberPageViewModel>(
          create: (context) => MemberPageViewModel(database: database),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
