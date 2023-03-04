import 'package:badmatch_app/infrastructure/entity/communities.dart';
import 'package:drift/drift.dart';

class Members extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get level => integer()();
  IntColumn get communityId => integer().references(Communities, #id)();
}
