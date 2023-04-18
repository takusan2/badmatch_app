import 'package:badmatch_app/business_logic/interface/match_repository.dart';
import 'package:badmatch_app/business_logic/interface/member_repository.dart';
import 'package:badmatch_app/business_logic/match_logic.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/model/advanced_member.dart';

class MemberLogic {
  final MemberRepository memberRepository;
  final MatchRepository matchRepository;
  const MemberLogic(this.memberRepository, this.matchRepository);

  Future<void> insertMember(MembersCompanion membersCompanion) async {
    await memberRepository.insertMember(membersCompanion);
  }

  Future<List<Member>> fetchMembers(
    int communityId, {
    bool? isParticipant,
  }) async {
    return await memberRepository.fetchMembers(communityId);
  }

  Stream<List<Member>> watchMembers(int communityId) {
    return memberRepository.watchMembers(communityId);
  }

  Future<void> updateMember(Member member) async {
    await memberRepository.updateMember(member);
  }

  Future<void> deleteMember({int? id, int? communityId}) async {
    await memberRepository.deleteMember(id: id, communityId: communityId);
  }

  Stream<List<AdvancedMember>> watchAdvancedMembers(int communityId) async* {
    await for (List<Member> members
        in memberRepository.watchMembers(communityId)) {
      List<AdvancedMember> advancedMemberList = [];
      for (Member member in members) {
        int numMatches =
            await MatchLogic(matchRepository).calNumOfMatch(member.id);
        advancedMemberList
            .add(AdvancedMember(member: member, numMatches: numMatches));
      }
      yield advancedMemberList;
    }
  }
}
