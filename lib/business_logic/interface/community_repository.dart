import 'package:badmatch_app/infrastructure/database.dart';

abstract class CommunityRepository {
  Future<int> insertCommunity(String name);
  Future<List<Community>> fetchCommunities();
  Stream<List<Community>> watchCommunities();
  Future<void> updateCommunity({required int id, String? name});
  Future<void> deleteCommunity(int id);
}
