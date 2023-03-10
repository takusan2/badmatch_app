import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/repository/community_repository.dart';

class EditCommunityViewModel {
  final CommunityRepository communityRepository =
      CommunityRepository(MyDatabase().communityAccessor);

  String? communityName;

  Future<void> updateCommunity({required Community community}) async {
    return await communityRepository.updateCommunity(
        community: community, name: communityName);
  }
}
