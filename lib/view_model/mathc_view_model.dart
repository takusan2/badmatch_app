import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/model/participant.dart';
import 'package:badmatch_app/repository/member_repository.dart';

class MatchViewModel {
  final MemberRepository memberRepository = MemberRepository();

  Future<Participant> getPlayersList({
    required Community community,
    required int numCourt,
    required bool isSingle,
    required bool equalNumMatch,
    required bool closeLevel,
  }) async {
    return await memberRepository.getPlayersList(
      community: community,
      numCourt: numCourt,
      isSingle: isSingle,
      equalNumMatch: equalNumMatch,
      closeLevel: closeLevel,
    );
  }
}
