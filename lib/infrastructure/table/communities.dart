import 'package:drift/drift.dart';

@DataClassName('Community')
class Communities extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
