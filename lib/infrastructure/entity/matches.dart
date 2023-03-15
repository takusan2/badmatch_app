import 'package:badmatch_app/infrastructure/entity/communities.dart';
import 'package:drift/drift.dart';

@DataClassName('Match')
class Matches extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isSingle => boolean()();
  IntColumn get player1Id => integer()();
  IntColumn get player2Id => integer()();
  IntColumn get player3Id => integer().nullable()();
  IntColumn get player4Id => integer().nullable()();
  IntColumn get communityId =>
      integer().references(Communities, #id, onDelete: KeyAction.cascade)();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}
