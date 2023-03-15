import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:badmatch_app/model/advanced_member.dart';
import 'package:badmatch_app/model/participant.dart';
import 'package:drift/drift.dart';

class MemberRepository {
  final MemberAccessor memberAccessor;
  final MatchAccessor matchAccessor;

  MemberRepository({
    required this.memberAccessor,
    required this.matchAccessor,
  });

  Future<void> insertMember({
    required String name,
    required SexEnum sex,
    required int level,
    required int communityId,
    int? age,
  }) {
    MembersCompanion membersCompanion = MembersCompanion.insert(
      name: name,
      sex: sex,
      age: age != null ? Value(age) : const Value(null),
      level: level,
      communityId: communityId,
    );
    return memberAccessor.insertMember(membersCompanion: membersCompanion);
  }

  Future<List<Member>> getCommunityMembers(int communityId) =>
      memberAccessor.getCommunityMembers(communityId);

  Stream<List<AdvancedMember>> watchCommunityAdvancedMembers(
      int communityId) async* {
    await for (List<Member> members
        in memberAccessor.watchCommunityMembers(communityId)) {
      List<AdvancedMember> advancedMemberList = [];
      for (Member member in members) {
        int numMatches = await getNumTodayMemberMatches(member);
        advancedMemberList
            .add(AdvancedMember(member: member, numMatches: numMatches));
      }
      yield advancedMemberList;
    }
  }

  Future<void> updateMember({
    required Member member,
    String? name,
    SexEnum? sex,
    int? level,
    int? age,
    bool? isParticipant,
  }) {
    MembersCompanion membersCompanion = MembersCompanion(
      name: name != null ? Value(name) : const Value.absent(),
      sex: sex != null ? Value(sex) : const Value.absent(),
      age: age != null ? Value(age) : const Value.absent(),
      level: level != null ? Value(level) : const Value.absent(),
      isParticipant:
          isParticipant != null ? Value(isParticipant) : const Value.absent(),
    );
    return memberAccessor.updateMember(
      member: member,
      membersCompanion: membersCompanion,
    );
  }

  Future<void> updateMembers(
      {required Map<Member, MembersCompanion> membersCompanionMap}) async {
    membersCompanionMap.forEach(
      (member, membersCompanion) async {
        await memberAccessor.updateMember(
          member: member,
          membersCompanion: membersCompanion,
        );
      },
    );
  }

  Future<void> deleteMember({required Member member}) =>
      memberAccessor.deleteMember(member);

  Future<void> deleteMembers({required List<Member> memberList}) async {
    for (Member member in memberList) {
      await memberAccessor.deleteMember(member);
    }
  }

  Future<List<Member>> getParticipants(Community community) async {
    return await memberAccessor.getParticipants(community.id);
  }

  Future<int> getNumTodayMemberMatches(Member member) async {
    int numMatches = (await matchAccessor.getTodayMemberMatches(member)).length;
    return numMatches;
  }

  Future<List<Member>> _getCandidates({
    required Community community,
    required bool equalNumMatch,
    required bool closeLevel,
  }) async {
    List<Member> participantList =
        await memberAccessor.getParticipants(community.id);
    participantList.shuffle();
    if (closeLevel) {
      participantList.sort(((a, b) => a.level.compareTo(b.level)));
    }

    if (equalNumMatch) {
      List<int> numMatchesList =
          await Future.wait(participantList.map((member) async {
        return await getNumTodayMemberMatches(member);
      }));

      List<Member> copiedParticipantList = List.from(participantList);

      participantList.sort(((a, b) {
        return numMatchesList[copiedParticipantList.indexOf(a)]
            .compareTo(numMatchesList[copiedParticipantList.indexOf(b)]);
      }));
    }

    return participantList;
  }

  Future<void> _insertMatchs({required MatchesCompanion matchesCompanion}) {
    return MyDatabase()
        .matchAccessor
        .insertMatch(matchesCompanion: matchesCompanion);
  }

  Future<Participant> getPlayersList(
      {required Community community,
      required int numCourt,
      required bool isSingle,
      required bool equalNumMatch,
      required bool closeLevel}) async {
    List<List<Member>> playersList = [];
    List<Member> candidateList = await _getCandidates(
        community: community,
        equalNumMatch: equalNumMatch,
        closeLevel: closeLevel);
    int rate = isSingle ? 2 : 4;
    for (int i = 0; i < numCourt; i++) {
      playersList.add(candidateList.sublist(i * rate, i * rate + rate));
    }
    List<Member> remainMembers = candidateList.sublist(numCourt * rate);

    for (List<Member> players in playersList) {
      isSingle
          ? _insertMatchs(
              matchesCompanion: MatchesCompanion.insert(
              isSingle: isSingle,
              player1Id: players[0].id,
              player2Id: players[1].id,
              communityId: community.id,
            ))
          : _insertMatchs(
              matchesCompanion: MatchesCompanion.insert(
              isSingle: isSingle,
              player1Id: players[0].id,
              player2Id: players[1].id,
              player3Id: Value(players[2].id),
              player4Id: Value(players[3].id),
              communityId: community.id,
            ));
    }

    return Participant(playersList: playersList, remainMembers: remainMembers);
  }
}
