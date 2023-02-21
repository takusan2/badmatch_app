import 'dart:io';

import 'package:badmatch_app/infrastructure/table/communities.dart';
import 'package:badmatch_app/infrastructure/table/members.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Members,
  Communities,
])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Member>> get allMemberEntries => select(members).get();
  Future<List<Community>> get allCommuntyEntries => select(communities).get();

  Future<int> insertMember(MembersCompanion entry) =>
      into(members).insert(entry);
  Future<int> insertCommunity(CommunitiesCompanion entry) =>
      into(communities).insert(entry);

  Future<void> deleteCommunity(Community community) {
    return (delete(communities)..where((cbl) => cbl.id.equals(community.id)))
        .go();
  }

  Future<List<Member>> getMembersByCommunityId(int communityId) {
    return (select(members)..where((t) => t.id.equals(communityId))).get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
