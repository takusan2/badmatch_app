import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/repository/member_repository.dart';

class MatchConfigViewModel {
  int numCourt = 1;
  bool isSingle = true;
  bool equalNumMatch = true;
  bool closeLevel = true;
  late int numParticipants;

  final MemberRepository memberRepository = MemberRepository();

  Future<void> setNumParticipants(Community community) async {
    numParticipants =
        (await memberRepository.getParticipants(community)).length;
  }
}
