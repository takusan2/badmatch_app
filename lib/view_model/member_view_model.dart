import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/model/advanced_member.dart';
import 'package:badmatch_app/repository/member_repository.dart';

class MemberViewModel {
  final MemberRepository memberRepository = MemberRepository();
  bool editFlag = false;

  Future<List<Member>> getCommunityMembers(int communityId) async {
    return await memberRepository.getCommunityMembers(communityId);
  }

  Stream<List<AdvancedMember>> watchCommunityAdvancedMembers(int communityId) {
    return memberRepository.watchCommunityAdvancedMembers(communityId);
  }

  Future<int> getNumMatches(Member member) {
    return memberRepository.getNumTodayMemberMatches(member);
  }

  Future<void> updateMemberIsParticipant({
    required Member member,
    required bool isParticipant,
  }) {
    return memberRepository.updateMember(
      member: member,
      isParticipant: isParticipant,
    );
  }

  Future<void> deleteMember(Member member) async {
    await memberRepository.deleteMember(member: member);
  }
}
