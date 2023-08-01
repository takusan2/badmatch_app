part of '../database.dart';

@DriftAccessor(tables: [Communities])
class CommunityAccessor extends DatabaseAccessor<MyDatabase>
    with _$CommunityAccessorMixin
    implements CommunityRepository {
  CommunityAccessor(MyDatabase db) : super(db);

  @override
  Future<int> insertCommunity(String name) async =>
      await into(communities).insert(CommunitiesCompanion(name: Value(name)));

  @override
  Future<List<Community>> fetchCommunities() async =>
      await select(communities).get();

  @override
  Stream<List<Community>> watchCommunities() => select(communities).watch();

  @override
  Future<void> deleteCommunity(int id) async {
    await (delete(communities)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> updateCommunity({
    required id,
    String? name,
  }) async {
    CommunitiesCompanion communitiesCompanion = CommunitiesCompanion(
      name: name != null ? Value(name) : const Value.absent(),
    );
    await (update(communities)..where((t) => t.id.equals(id)))
        .write(communitiesCompanion);
  }
}
