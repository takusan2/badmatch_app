part of '../database.dart';

@DriftAccessor(tables: [Matches])
class MatchAccessor extends DatabaseAccessor<MyDatabase>
    with _$MatchAccessorMixin {
  MatchAccessor(MyDatabase db) : super(db);

  Future<void> insertMatch({required MatchesCompanion matchesCompanion}) =>
      into(matches).insert(matchesCompanion);

  Future<List<Match>> getCommunityMatches(Community community) =>
      (select(matches)..where((t) => t.communityId.equals(community.id))).get();

  Future<List<Match>> getTodayMemberMatches(Member member) {
    DateTime today = DateTime.now();
    DateTime startOfDay = DateTime(today.year, today.month, today.day);
    DateTime endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(matches)
          ..where((t) => ((t.createdAt
                  .isBetween(Constant(startOfDay), Constant(endOfDay))) &
              (t.player1Id.equals(member.id) |
                  t.player2Id.equals(member.id) |
                  t.player3Id.equals(member.id) |
                  t.player4Id.equals(member.id)))))
        .get();
  }

  Future<void> updateMatch({
    required Match match,
    required MatchesCompanion matchesCompanion,
  }) =>
      (update(matches)..where((t) => t.id.equals(match.id)))
          .write(matchesCompanion);

  Future<void> deleteMatch({required match}) =>
      (delete(matches)..where((t) => t.id.equals(match.id))).go();
}
