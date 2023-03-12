import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/repository/member_repository.dart';

class MatchViewModel {
  final MemberRepository _memberAccessor =
      MemberRepository(MyDatabase().memberAccessor);

  Future<List<List<Member>>> getPlayersList({
    required Community community,
    required int numCourt,
  }) async {
    return await _memberAccessor.getPlayersList(
      community: community,
      numCourt: numCourt,
    );
  }
}
