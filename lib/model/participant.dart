import 'package:badmatch_app/infrastructure/database.dart';

class Participant {
  final List<List<Member>> playersList;
  final List<Member> remainMembers;
  Participant({required this.playersList, required this.remainMembers});
}
