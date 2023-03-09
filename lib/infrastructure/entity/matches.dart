import 'package:badmatch_app/infrastructure/entity/communities.dart';
import 'package:drift/drift.dart';

@DataClassName('Match')
class Matches extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isSingles => boolean()();
  IntColumn get player1Id => integer()();
  IntColumn get player2Id => integer()();
  IntColumn get player3Id => integer()();
  IntColumn get player4Id => integer()();
  IntColumn get communityId =>
      integer().references(Communities, #id, onDelete: KeyAction.cascade)();
}

// @DataClassName('Match')
// class Matches extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   BoolColumn get isSingles => boolean()();
//   IntColumn get player1Id =>
//       integer().references(Members, #id, onDelete: KeyAction.cascade)();
//   IntColumn get player2Id =>
//       integer().references(Members, #id, onDelete: KeyAction.cascade)();
//   IntColumn get player3Id =>
//       integer().references(Members, #id, onDelete: KeyAction.cascade)();
//   IntColumn get player4Id =>
//       integer().references(Members, #id, onDelete: KeyAction.cascade)();
//   IntColumn get communityId =>
//       integer().references(Communities, #id, onDelete: KeyAction.cascade)();
// }
