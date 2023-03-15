import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/repository/member_repository.dart';
import 'package:flutter/material.dart';

class AddMemberViewModel extends ChangeNotifier {
  final MemberRepository memberRepository = MemberRepository(
    memberAccessor: MyDatabase().memberAccessor,
    matchAccessor: MyDatabase().matchAccessor,
  );
  final formKey = GlobalKey<FormState>();

  late String name;
  SexEnum _sex = SexEnum.female;
  int level = 1;
  int? age;

  set sex(SexEnum sex) {
    _sex = sex;
    notifyListeners();
  }

  SexEnum get sex => _sex;

  Future<void> insertMember(Community community) async {
    await memberRepository.insertMember(
      name: name,
      sex: _sex,
      level: level,
      age: age,
      communityId: community.id,
    );
  }
}