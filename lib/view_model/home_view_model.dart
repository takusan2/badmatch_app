import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/repository/community_repository.dart';

class HomeViewModel {
  final CommunityRepository communityRepository =
      CommunityRepository(MyDatabase().communityAccessor);

  bool editFlag = false;

  Stream<List<Community>> watachCommunities() {
    return communityRepository.watchCommunities();
  }

  Future<void> deleteCommunity(Community community) async {
    await communityRepository.deleteCommunity(community);
  }
}
