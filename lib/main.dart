import 'package:badmatch_app/business_logic/community_logic.dart';
import 'package:badmatch_app/business_logic/member_logic.dart';
import 'package:badmatch_app/controller/community_controller.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/view/edit_member_page/edit_member_page_state.dart';
import 'package:badmatch_app/view/edit_member_page/edit_member_page_state_notifier.dart';
import 'package:badmatch_app/view/home_page/home_page.dart';
import 'package:badmatch_app/view/home_page/home_page_state.dart';
import 'package:badmatch_app/view/home_page/home_page_state_notifier.dart';
import 'package:badmatch_app/view/match_config_page/match_config_page_state.dart';
import 'package:badmatch_app/view/match_config_page/match_config_page_state_notifier.dart';
import 'package:badmatch_app/view/member_page/member_page_state.dart';
import 'package:badmatch_app/view/member_page/member_page_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MultiProvider(providers: [
    Provider(create: (context) => CommunityController()),
    Provider<CommunityLogic>(
        create: (context) => CommunityLogic(MyDatabase().communityAccessor)),
    Provider<MemberLogic>(
        create: (context) => MemberLogic(
            MyDatabase().memberAccessor, MyDatabase().matchAccessor)),
    StateNotifierProvider<HomePageStateNotifier, HomePageState>(
        create: (context) => HomePageStateNotifier()),
    StateNotifierProvider<MemberPageStateNotifier, MemberPageState>(
        create: (context) => MemberPageStateNotifier()),
    StateNotifierProvider<MatchConfigPageStateNotifier, MatchConfigPageState>(
        create: (context) => MatchConfigPageStateNotifier()),
    StateNotifierProvider<EditMemberPageStateNotifier, EditMemberPageState>(
        create: (context) => EditMemberPageStateNotifier()),
  ], child: const MyApp()));
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
