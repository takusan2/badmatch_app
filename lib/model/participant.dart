import 'package:badmatch_app/model/advanced_member.dart';

class ParticipantsModel {
  final List<List<AdvancedMember>> playersList;
  final List<AdvancedMember> remainMemberList;
  ParticipantsModel(
      {required this.playersList, required this.remainMemberList});
}
