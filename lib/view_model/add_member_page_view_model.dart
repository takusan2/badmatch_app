import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/repository/member_repository.dart';

class AddMemberPageViewModel {
  final MemberRepository memberRepository =
      MemberRepository(MyDatabase().memberAccessor);

  Future<void> insert(
      {required String name,
      required SexEnum sex,
      required int level,
      required int communityId,
      int? age}) async {
    await memberRepository.insertMember(
      name: name,
      sex: sex,
      level: level,
      age: age,
      communityId: communityId,
    );
  }
}
