import 'package:badmatch_app/business_logic/interface/match_repository.dart';
import 'package:badmatch_app/infrastructure/database.dart';

class MatchLogic {
  final MatchRepository matchRepository;
  const MatchLogic(this.matchRepository);

  Future<void> fetchMatches({int? memberId, int? communityId}) async {
    await matchRepository.fetchMatches(
      memberId: memberId,
      communityId: communityId,
    );
  }

  Future<void> updateMatches(Match match) async {
    await matchRepository.updateMatch(match);
  }

  Future<void> deleteMatches(int id) async {
    await matchRepository.deleteMatch(id);
  }

  Future<int> calNumOfMatch(int memberId) async {
    List<Match> matchList =
        await matchRepository.fetchTodayMemberMatches(memberId);
    print('$memberId: $matchList');
    return matchList.length;
  }
}
