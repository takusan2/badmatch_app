part of '../database.dart';

@DriftAccessor(tables: [Matches])
class MatchAccessor extends DatabaseAccessor<MyDatabase>
    with _$MatchAccessorMixin {
  MatchAccessor(MyDatabase db) : super(db);

  Future<int> insertMember(
          {required String name,
          required int level,
          required int communityId}) =>
      into(matches).insert(
        MatchesCompanion(),
      );
}
