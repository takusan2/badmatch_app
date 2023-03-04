import 'package:badmatch_app/infrastructure/database.dart';

class MemberRepository {
  final MemberAccessor _memberAccessor;

  MemberRepository(this._memberAccessor);

  Future<void> insertMember(
          {required String name,
          required int level,
          required int communityId}) =>
      _memberAccessor.insertMember(
        name: name,
        level: level,
        communityId: communityId,
      );

  Future<List<Member>> getCommunityMembers(int communityId) =>
      _memberAccessor.getCommunityMembers(communityId);

  Stream<List<Member>> watchCommunityMembers(int communityId) =>
      _memberAccessor.watchCommunityMembers(communityId);

  Future<void> updateMember({
    required Member member,
    required String name,
    required int level,
  }) =>
      _memberAccessor.updateMember(
        member: member,
        name: name,
        level: level,
      );

  Future<void> deleteMember({required Member member}) =>
      _memberAccessor.deleteMember(member);
}
