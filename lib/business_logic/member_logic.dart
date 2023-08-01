import 'package:badmatch_app/business_logic/interface/match_repository.dart';
import 'package:badmatch_app/business_logic/interface/member_repository.dart';
import 'package:badmatch_app/business_logic/match_logic.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/model/advanced_member.dart';
import 'package:badmatch_app/model/participant.dart';
import 'package:drift/drift.dart';

class MemberLogic {
  final MemberRepository memberRepository;
  final MatchRepository matchRepository;
  const MemberLogic(this.memberRepository, this.matchRepository);

  Future<void> insertMember(MembersCompanion membersCompanion) async {
    await memberRepository.insertMember(membersCompanion);
  }

  Future<List<Member>> fetchMembers({
    int? communityId,
    bool? isParticipant,
  }) async {
    return await memberRepository.fetchMembers(
      communityId: communityId,
      isParticipant: isParticipant,
    );
  }

  Stream<List<Member>> watchMembers(
    int? communityId,
    bool? isParticipant,
  ) {
    return memberRepository.watchMembers(
      communityId: communityId,
      isParticipant: isParticipant,
    );
  }

  Future<void> updateMember(Member member) async {
    await memberRepository.updateMember(member);
  }

  Future<void> deleteMember({int? id, int? communityId}) async {
    await memberRepository.deleteMember(id: id, communityId: communityId);
  }

  Stream<List<AdvancedMember>> watchAdvancedMembers(int communityId) async* {
    await for (List<Member> members
        in memberRepository.watchMembers(communityId: communityId)) {
      List<AdvancedMember> advancedMemberList = [];
      for (Member member in members) {
        int numMatches =
            await MatchLogic(matchRepository).calNumOfMatch(member.id);
        advancedMemberList
            .add(AdvancedMember(member: member, numMatches: numMatches));
      }
      yield advancedMemberList;
    }
  }

  Future<List<AdvancedMember>> fetchAdvancedMembers({
    required int communityId,
    bool? isParticipant,
  }) async {
    List<AdvancedMember> advancedMemberList = [];
    for (Member member in await memberRepository.fetchMembers(
      communityId: communityId,
      isParticipant: isParticipant,
    )) {
      int numMatches =
          await MatchLogic(matchRepository).calNumOfMatch(member.id);
      print(member.name);
      print(numMatches);
      advancedMemberList
          .add(AdvancedMember(member: member, numMatches: numMatches));
    }
    return advancedMemberList;
  }

  Future<ParticipantsModel> fetchParticipantModel(
    int communityId, {
    required int numCourt,
    required bool isSingle,
    required bool equalNumMatch,
    required bool closeLevel,
  }) async {
    List<List<AdvancedMember>> playersList = [];
    List<AdvancedMember> candidateList = await fetchAdvancedMembers(
      communityId: communityId,
      isParticipant: true,
    );

    if (closeLevel) {
      candidateList.sort(((a, b) => a.level.compareTo(b.level)));
    }

    if (equalNumMatch) {
      candidateList.sort(((a, b) {
        return a.numMatches.compareTo(b.numMatches);
      }));
    }

    int numPeople = isSingle ? 2 : 4;
    for (int i = 0; i < numCourt; i++) {
      playersList
          .add(candidateList.sublist(i * numPeople, i * numPeople + numPeople));
    }
    List<AdvancedMember> remainMembers =
        candidateList.sublist(numCourt * numPeople);

    for (List<AdvancedMember> players in playersList) {
      isSingle
          ? matchRepository.insertMatch(MatchesCompanion.insert(
              isSingle: isSingle,
              player1Id: players[0].id,
              player2Id: players[1].id,
              communityId: communityId,
            ))
          : matchRepository.insertMatch(MatchesCompanion.insert(
              isSingle: isSingle,
              player1Id: players[0].id,
              player2Id: players[1].id,
              player3Id: Value(players[2].id),
              player4Id: Value(players[3].id),
              communityId: communityId,
            ));
    }
    for (List<AdvancedMember> players in playersList) {
      for (AdvancedMember player in players) {
        print('${player.name}, ${player.numMatches}');
      }
    }

    return ParticipantsModel(
        playersList: playersList, remainMemberList: remainMembers);
  }
}
