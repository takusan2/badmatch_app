import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
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

  Future<void> insertMember({
    required String name,
    required int level,
    required SexEnum sex,
    int? age,
    required int communityId,
  }) async {
    await memberRepository.insertMember(
      name: name,
      level: level,
      sex: sex,
      age: age,
      communityId: communityId,
    );
  }

  Future<void> deleteMember(Member member) async {
    await memberRepository.deleteMember(member: member);
  }

  Future<void> updateName({
    required Member member,
    required String name,
    required SexEnum sex,
    int? age,
  }) async {
    await memberRepository.updateMember(
      member: member,
      name: name,
      level: member.level,
      sex: sex,
      age: age,
    );
  }

  Future<void> updateLevel({
    required Member member,
    required int level,
    required SexEnum sex,
    int? age,
  }) async {
    await memberRepository.updateMember(
      member: member,
      name: member.name,
      level: level,
      sex: sex,
      age: age,
    );
  }
}
