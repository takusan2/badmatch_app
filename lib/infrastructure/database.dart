import 'dart:io';

import 'package:badmatch_app/infrastructure/entity/communities.dart';
import 'package:badmatch_app/infrastructure/entity/members.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'accessor/community_accessor.dart';
part 'accessor/member_accessor.dart';
part 'database.g.dart';

@DriftDatabase(tables: [
  Members,
  Communities,
])
class MyDatabase extends _$MyDatabase {
  MyDatabase._() : super(_openConnection());

  factory MyDatabase() => _instance;

  static final MyDatabase _instance = MyDatabase._();

  @override
  int get schemaVersion => 1;

  MemberAccessor get memberAccessor => MemberAccessor(this);
  CommunityAccessor get communityAccessor => CommunityAccessor(this);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
