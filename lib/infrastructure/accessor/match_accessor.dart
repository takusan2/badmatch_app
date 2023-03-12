part of '../database.dart';

@DriftAccessor(tables: [Matches])
class MatchAccessor extends DatabaseAccessor<MyDatabase>
    with _$MatchAccessorMixin {
  MatchAccessor(MyDatabase db) : super(db);

  Future<void> insertMatch({required MatchesCompanion matchesCompanion}) =>
      into(matches).insert(matchesCompanion);

  Future<List<Match>> getCommunityMatches(Community community) =>
      (select(matches)..where((t) => t.communityId.equals(community.id))).get();

  Future<void> updateMatch({
    required Match match,
    required MatchesCompanion matchesCompanion,
  }) =>
      (update(matches)..where((t) => t.id.equals(match.id)))
          .write(matchesCompanion);

  Future<void> deleteMatch({required match}) =>
      (delete(matches)..where((t) => t.id.equals(match.id))).go();
}
