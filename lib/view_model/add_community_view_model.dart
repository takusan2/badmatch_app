import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/repository/community_repository.dart';

class AddCommunityViewModel {
  String _communityName = '';

  final CommunityRepository communityRepository =
      CommunityRepository(MyDatabase().communityAccessor);

  set communityName(String communityName) => _communityName = communityName;

  Future<void> insertCommunity() async {
    await communityRepository.insertCommunity(name: _communityName);
  }
}
