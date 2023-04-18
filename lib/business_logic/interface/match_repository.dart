import 'package:badmatch_app/infrastructure/database.dart';

abstract class MatchRepository {
  Future<int> insertMatch(MatchesCompanion matchesCompanion);
  Future<List<Match>> fetchMatches({int? memberId, int? communityId});
  Stream<List<Match>> watchMatches({int? memberId, int? communityId});
  Future<void> updateMatch(Match match);
  Future<void> deleteMatch(int id);
}
