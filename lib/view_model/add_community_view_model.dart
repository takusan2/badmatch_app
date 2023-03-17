import 'package:badmatch_app/repository/community_repository.dart';

class AddCommunityViewModel {
  String _communityName = '';

  final CommunityRepository communityRepository = CommunityRepository();

  set communityName(String communityName) => _communityName = communityName;

  Future<void> insertCommunity() async {
    await communityRepository.insertCommunity(name: _communityName);
  }
}
