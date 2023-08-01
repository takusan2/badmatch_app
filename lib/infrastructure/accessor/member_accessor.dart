part of '../database.dart';

@DriftAccessor(tables: [Members])
class MemberAccessor extends DatabaseAccessor<MyDatabase>
    with _$MemberAccessorMixin
    implements MemberRepository {
  MemberAccessor(MyDatabase db) : super(db);

  @override
  Future<int> insertMember(MembersCompanion membersCompanion) async {
    return await into(members).insert(membersCompanion);
  }

  @override
  Future<List<Member>> fetchMembers({
    int? communityId,
    bool? isParticipant,
  }) async {
    return await (select(members)
          ..where((t) => communityId == null
              ? const Constant(true)
              : t.communityId.equals(communityId))
          ..where((t) => isParticipant == null
              ? const Constant(true)
              : t.isParticipant.equals(isParticipant)))
        .get();
  }

  @override
  Stream<List<Member>> watchMembers({
    int? communityId,
    bool? isParticipant,
  }) {
    return (select(members)
          ..where((t) => communityId == null
              ? const Constant(true)
              : t.communityId.equals(communityId))
          ..where((t) => isParticipant == null
              ? const Constant(true)
              : t.isParticipant.equals(isParticipant)))
        .watch();
  }

  @override
  Future<void> updateMember(Member member) async {
    MembersCompanion membersCompanion = member.toCompanion(true);
    await (update(members)..where((t) => t.id.equals(member.id)))
        .write(membersCompanion);
  }

  @override
  Future<void> deleteMember({int? id, int? communityId}) async {
    if (id == null && communityId == null) {
      throw 'deleteMember must receive at least one argument';
    }
    await (delete(members)
          ..where((t) => id == null ? const Constant(true) : t.id.equals(id))
          ..where((t) => communityId == null
              ? const Constant(true)
              : t.communityId.equals(communityId)))
        .go();
  }

  Future<List<Member>> getParticipants(int communityId) {
    return (select(members)
          ..where((t) => t.communityId.equals(communityId))
          ..where((t) => t.isParticipant.equals(true)))
        .get();
  }
}
