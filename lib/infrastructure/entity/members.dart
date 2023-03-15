import 'package:badmatch_app/infrastructure/entity/communities.dart';
import 'package:drift/drift.dart';

enum SexEnum { male, female }

class Members extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get sex => intEnum<SexEnum>()();
  IntColumn get age => integer().nullable()();
  IntColumn get level =>
      integer().customConstraint('NOT NULL CHECK (level BETWEEN 1 AND 5)')();
  BoolColumn get isParticipant =>
      boolean().withDefault(const Constant(false))();
  IntColumn get communityId =>
      integer().references(Communities, #id, onDelete: KeyAction.cascade)();
}
