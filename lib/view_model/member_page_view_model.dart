import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/repository/member_repository.dart';

class MemberPageViewModel {
  final MemberRepository memberRepository =
      MemberRepository(MyDatabase().memberAccessor);

  Future<List<Member>> getCommunityMembers(int communityId) async {
    return await memberRepository.getCommunityMembers(communityId);
  }

  Stream<List<Member>> watchCommunityMembers(int communityId) {
    return memberRepository.watchCommunityMembers(communityId);
  }

  Future<void> insert({
    required String name,
    required int level,
    required int communityId,
  }) async {
    await memberRepository.insertMember(
      name: name,
      level: level,
      communityId: communityId,
    );
  }

  Future<void> delete(Member member) async {
    await memberRepository.deleteMember(member: member);
  }

  Future<void> updateName({
    required Member member,
    required String name,
  }) async {
    await memberRepository.updateMember(
      member: member,
      name: name,
      level: member.level,
    );
  }

  Future<void> updateLevel({
    required Member member,
    required int level,
  }) async {
    await memberRepository.updateMember(
      member: member,
      name: member.name,
      level: level,
    );
  }
}
