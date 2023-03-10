import 'package:badmatch_app/infrastructure/database.dart';
import 'package:drift/drift.dart';

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
    String? name,
  }) {
    return _communityAccessor.updateCommunity(
        community: community,
        communitiesCompanion: CommunitiesCompanion(
          name: name != null ? Value(name) : const Value.absent(),
        ));
  }
}
