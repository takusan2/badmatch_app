import 'package:badmatch_app/infrastructure/database.dart';

class CommunityRepository {
  final CommunityAccessor _communityAccessor;
  CommunityRepository(this._communityAccessor);

  Future<int> insertCommunity({required String name}) =>
      _communityAccessor.insertCommunity(name: name);

  Future<List<Community>> getCommunities() => _communityAccessor.getCommunties;

  Stream<List<Community>> watchCommunities() =>
      _communityAccessor.watchCommunities();

  Future<void> deleteCommunity(Community community) =>
      _communityAccessor.deleteCommunity(community);

  Future<void> updateCommunity({
    required Community community,
    required String name,
  }) =>
      _communityAccessor.updateCommunity(community: community, name: name);
}
