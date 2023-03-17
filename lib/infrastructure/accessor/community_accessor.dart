part of '../database.dart';

@DriftAccessor(tables: [Communities])
class CommunityAccessor extends DatabaseAccessor<MyDatabase>
    with _$CommunityAccessorMixin {
  CommunityAccessor(MyDatabase db) : super(db);

  Future<List<Community>> get getCommunties => select(communities).get();

  Future<int> insertCommunity({required String name}) =>
      into(communities).insert(
        CommunitiesCompanion(
          name: Value(name),
        ),
      );

  Stream<List<Community>> watchCommunities() => select(communities).watch();

  Future<void> deleteCommunity(Community community) {
    return (delete(communities)..where((t) => t.id.equals(community.id))).go();
  }

  Future<void> updateCommunity({
    required Community community,
    required CommunitiesCompanion communitiesCompanion,
  }) {
    return (update(communities)..where((t) => t.id.equals(community.id)))
        .write(communitiesCompanion);
  }
}
