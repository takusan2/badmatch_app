import 'package:badmatch_app/view/home_view.dart';
import 'package:badmatch_app/view_model/add_member_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AddMemberViewModel>(
        create: (context) => AddMemberViewModel())
  ], child: const MyApp()));
  // print(await MyDatabase().memberAccessor.getAllMembers());
  // print(await MyDatabase().communityAccessor.getCommunties);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}
