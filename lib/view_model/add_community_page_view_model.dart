import 'package:badmatch_app/infrastructure/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

class AddCommunityPageViewModel extends ChangeNotifier {
  final MyDatabase database;
  AddCommunityPageViewModel({required this.database});

  Future<void> insert({required String name}) async {
    await database.insertCommunity(CommunitiesCompanion(name: Value(name)));
    notifyListeners();
  }
}
