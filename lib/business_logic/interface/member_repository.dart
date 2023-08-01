import 'package:badmatch_app/infrastructure/database.dart';

abstract class MemberRepository {
  Future<int> insertMember(MembersCompanion membersCompanion);
  Future<List<Member>> fetchMembers({int? communityId, bool? isParticipant});
  Stream<List<Member>> watchMembers({int? communityId, bool? isParticipant});
  Future<void> updateMember(Member member);
  Future<void> deleteMember({int? id, int? communityId});
}
