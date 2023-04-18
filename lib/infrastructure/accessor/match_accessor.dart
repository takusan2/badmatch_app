part of '../database.dart';

@DriftAccessor(tables: [Matches])
class MatchAccessor extends DatabaseAccessor<MyDatabase>
    with _$MatchAccessorMixin
    implements MatchRepository {
  MatchAccessor(MyDatabase db) : super(db);

  @override
  Future<int> insertMatch(MatchesCompanion matchesCompanion) async {
    return await into(matches).insert(matchesCompanion);
  }

  @override
  Future<List<Match>> fetchMatches({int? memberId, int? communityId}) async {
    return await (select(matches)
          ..where((t) => memberId == null
              ? const Constant(true)
              : t.communityId.equals(memberId))
          ..where((t) => communityId == null
              ? const Constant(true)
              : t.communityId.equals(communityId)))
        .get();
  }

  @override
  Stream<List<Match>> watchMatches({int? memberId, int? communityId}) {
    return (select(matches)
          ..where((t) => memberId == null
              ? const Constant(true)
              : t.communityId.equals(memberId))
          ..where((t) => communityId == null
              ? const Constant(true)
              : t.communityId.equals(communityId)))
        .watch();
  }

  Future<List<Match>> getCommunityMatches(Community community) =>
      (select(matches)..where((t) => t.communityId.equals(community.id))).get();

  Future<List<Match>> getTodayMemberMatches(Member member) {
    DateTime today = DateTime.now();
    DateTime startOfDay = DateTime(today.year, today.month, today.day);
    DateTime endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(matches)
          ..where((t) => ((t.createdAt.isBetween(
                  Constant(startOfDay.millisecondsSinceEpoch),
                  Constant(endOfDay.millisecondsSinceEpoch))) &
              (t.player1Id.equals(member.id) |
                  t.player2Id.equals(member.id) |
                  t.player3Id.equals(member.id) |
                  t.player4Id.equals(member.id)))))
        .get();
  }

  @override
  Future<void> updateMatch(Match match) async {
    MatchesCompanion matchesCompanion = match.toCompanion(true);
    await (update(matches)..where((t) => t.id.equals(match.id)))
        .write(matchesCompanion);
  }

  @override
  Future<void> deleteMatch(int id) =>
      (delete(matches)..where((t) => t.id.equals(id))).go();

  Future<void> deleteWeekAgoMatch() async {
    DateTime weekAgo = DateTime.now().subtract(const Duration(days: 7));
    (delete(matches)
          ..where(
            (t) => t.createdAt
                .isSmallerThan(Constant(weekAgo.millisecondsSinceEpoch)),
          ))
        .go();
  }
}
