import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/repository/community_repository.dart';

class HomePageViewModel {
  final CommunityRepository communityRepository =
      CommunityRepository(MyDatabase().communityAccessor);

  Stream<List<Community>> watachCommunities() {
    return communityRepository.watchCommunities();
  }

  Future<void> insert({required String name}) async {
    await communityRepository.insertCommunity(name: name);
  }

  Future<void> delete(Community community) async {
    await communityRepository.deleteCommunity(community);
  }
}
