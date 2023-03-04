part of '../database.dart';

@DriftAccessor(tables: [Members])
class MemberAccessor extends DatabaseAccessor<MyDatabase>
    with _$MemberAccessorMixin {
  MemberAccessor(MyDatabase db) : super(db);

  Future<int> insertMember(
          {required String name,
          required int level,
          required int communityId}) =>
      into(members).insert(
        MembersCompanion(
            name: Value(name),
            level: Value(level),
            communityId: Value(communityId)),
      );

  Future<List<Member>> getCommunityMembers(int communityId) {
    return (select(members)..where((t) => t.communityId.equals(communityId)))
        .get();
  }

  Stream<List<Member>> watchCommunityMembers(int communityId) {
    return (select(members)..where((t) => t.communityId.equals(communityId)))
        .watch();
  }

  Future<void> updateMember({
    required Member member,
    required String name,
    required int level,
  }) {
    return (update(members)..where((t) => t.id.equals(member.id))).write(
      MembersCompanion(
        name: Value(name),
        level: Value(level),
      ),
    );
  }

  Future<void> deleteMember(Member member) =>
      (delete(members)..where((t) => t.id.equals(member.id))).go();
}
