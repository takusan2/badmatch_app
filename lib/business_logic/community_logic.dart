import 'package:badmatch_app/business_logic/interface/community_repository.dart';
import 'package:badmatch_app/infrastructure/database.dart';

class CommunityLogic {
  final CommunityRepository communityRepository;
  const CommunityLogic(this.communityRepository);

  Future<void> insertCommunity(String name) async {
    await communityRepository.insertCommunity(name);
  }

  Future<List<Community>> fetchCommunities() async {
    return await communityRepository.fetchCommunities();
  }

  Stream<List<Community>> watchCommunities() {
    return communityRepository.watchCommunities();
  }

  Future<void> updateCommunity({required int id, String? name}) async {
    await communityRepository.updateCommunity(id: id, name: name);
  }

  Future<void> deleteCommunity(int id) async {
    await communityRepository.deleteCommunity(id);
  }
}
