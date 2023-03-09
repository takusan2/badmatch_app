import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/view/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  print(await MyDatabase().memberAccessor.getAllMembers());
  print(await MyDatabase().communityAccessor.getCommunties);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
