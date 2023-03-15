import 'package:badmatch_app/controller/community_controller.dart';
import 'package:badmatch_app/view/home_view.dart';
import 'package:badmatch_app/view_model/add_member_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AddMemberViewModel>(
        create: (context) => AddMemberViewModel()),
    Provider(create: (context) => CommunityController())
  ], child: const MyApp()));
  // print((await MyDatabase().memberAccessor.getAllMembers())[1]);
  // print(await MyDatabase().communityAccessor.getCommunties);
  // print(await MyDatabase().matchAccessor.getCommunityMatches(
  //     (await MyDatabase().communityAccessor.getCommunties)[0]));
  // print(await MyDatabase().matchAccessor.getTodayMemberMatches(
  //     (await MyDatabase().memberAccessor.getAllMembers())[1]));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
