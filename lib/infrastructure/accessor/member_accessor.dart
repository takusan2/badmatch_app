part of '../database.dart';

@DriftAccessor(tables: [Members])
class MemberAccessor extends DatabaseAccessor<MyDatabase>
    with _$MemberAccessorMixin {
  MemberAccessor(MyDatabase db) : super(db);

  Future<int> insertMember({required MembersCompanion membersCompanion}) =>
      into(members).insert(membersCompanion);

  Future<List<Member>> getAllMembers() {
    return (select(members)).get();
  }

  Future<List<Member>> getCommunityMembers(int communityId) {
    return (select(members)..where((t) => t.communityId.equals(communityId)))
        .get();
  }

  Future<List<Member>> getParticipants(int communityId) {
    return (select(members)
          ..where((t) => t.communityId.equals(communityId))
          ..where((t) => t.isParticipant.equals(true)))
        .get();
  }

  Stream<List<Member>> watchCommunityMembers(int communityId) {
    return (select(members)..where((t) => t.communityId.equals(communityId)))
        .watch();
  }

  Future<void> updateMember({
    required Member member,
    required MembersCompanion membersCompanion,
  }) {
    return (update(members)..where((t) => t.id.equals(member.id))).write(
      membersCompanion,
    );
  }

  Future<void> deleteMember(Member member) =>
      (delete(members)..where((t) => t.id.equals(member.id))).go();

  Future<void> deleteCommunityMembers({required Community community}) async {
    (delete(members)..where((t) => t.communityId.equals(community.id))).go();
  }
}
