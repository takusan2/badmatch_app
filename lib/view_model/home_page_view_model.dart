import 'package:badmatch_app/infrastructure/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

class HomePageViewModel extends ChangeNotifier {
  final MyDatabase database;
  HomePageViewModel({required this.database});

  List<Community> _communityList = [];

  Future<List<Community>> _fetchCommunity() async {
    _communityList = await database.allCommuntyEntries;
    return _communityList;
  }

  Future<List<Community>> get communityList async => await _fetchCommunity();

  Future<void> insert({required String name}) async {
    await database.insertCommunity(CommunitiesCompanion(name: Value(name)));
    notifyListeners();
  }

  Future<void> delete(Community community) async {
    await database.deleteCommunity(community);
    notifyListeners();
  }
}
