import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';

class AdvancedMember {
  final Member member;
  int numMatches;
  AdvancedMember({required this.member, required this.numMatches});

  int get id => member.id;
  String get name => member.name;
  SexEnum get sex => member.sex;
  int? get age => member.age;
  int get level => member.level;
  bool get isParticipant => member.isParticipant;
  int get communityId => member.communityId;
}
