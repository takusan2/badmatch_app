import 'package:badmatch_app/infrastructure/database.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

class MemberPageViewModel extends ChangeNotifier {
  MemberPageViewModel({required this.database});

  final MyDatabase database;

  Future<List<Member>> get allMember async => await database.allMemberEntries;

  Future<List<Member>> memberList(int communityId) async {
    return await database.getMembersByCommunityId(communityId);
  }

  Future<void> insert({
    required String name,
    required int level,
    required int communityId,
  }) async {
    await database.insertMember(
      MembersCompanion(
        name: Value(name),
        level: Value(level),
        communityId: Value(communityId),
      ),
    );
    notifyListeners();
  }

  Future<void> delete(Member member) async {
    await database.deleteMember(member);
    notifyListeners();
  }

  Future<void> updateName({
    required Member member,
    required String name,
  }) async {
    await database.updateMember(
      member: member,
      name: name,
      level: member.level,
    );
  }

  Future<void> updateLevel({
    required Member member,
    required int level,
  }) async {
    await database.updateMember(
      member: member,
      name: member.name,
      level: level,
    );
    notifyListeners();
  }
}
