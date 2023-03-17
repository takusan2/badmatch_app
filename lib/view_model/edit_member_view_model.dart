import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/repository/member_repository.dart';
import 'package:flutter/material.dart';

class EditMemberViewModel {
  final MemberRepository memberRepository = MemberRepository();
  final formKey = GlobalKey<FormState>();

  String? name;
  SexEnum? sex;
  int? level;
  int? age;

  Future<void> updateMember(Member member) async {
    await memberRepository.updateMember(
      member: member,
      name: name,
      sex: sex,
      level: level,
      age: age,
    );
  }
}
