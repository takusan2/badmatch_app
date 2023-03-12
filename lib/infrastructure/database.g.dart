// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CommunitiesTable extends Communities
    with TableInfo<$CommunitiesTable, Community> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommunitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'communities';
  @override
  String get actualTableName => 'communities';
  @override
  VerificationContext validateIntegrity(Insertable<Community> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Community map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Community(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CommunitiesTable createAlias(String alias) {
    return $CommunitiesTable(attachedDatabase, alias);
  }
}

class Community extends DataClass implements Insertable<Community> {
  final int id;
  final String name;
  const Community({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CommunitiesCompanion toCompanion(bool nullToAbsent) {
    return CommunitiesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Community.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Community(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Community copyWith({int? id, String? name}) => Community(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Community(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Community && other.id == this.id && other.name == this.name);
}

class CommunitiesCompanion extends UpdateCompanion<Community> {
  final Value<int> id;
  final Value<String> name;
  const CommunitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CommunitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Community> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CommunitiesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CommunitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommunitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $MembersTable extends Members with TableInfo<$MembersTable, Member> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumnWithTypeConverter<SexEnum, int> sex =
      GeneratedColumn<int>('sex', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<SexEnum>($MembersTable.$convertersex);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL CHECK (level BETWEEN 1 AND 5)');
  static const VerificationMeta _isParticipantMeta =
      const VerificationMeta('isParticipant');
  @override
  late final GeneratedColumn<bool> isParticipant =
      GeneratedColumn<bool>('is_participant', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_participant" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  static const VerificationMeta _numMatchMeta =
      const VerificationMeta('numMatch');
  @override
  late final GeneratedColumn<int> numMatch = GeneratedColumn<int>(
      'num_match', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _communityIdMeta =
      const VerificationMeta('communityId');
  @override
  late final GeneratedColumn<int> communityId = GeneratedColumn<int>(
      'community_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES communities (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, sex, age, level, isParticipant, numMatch, communityId];
  @override
  String get aliasedName => _alias ?? 'members';
  @override
  String get actualTableName => 'members';
  @override
  VerificationContext validateIntegrity(Insertable<Member> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_sexMeta, const VerificationResult.success());
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('is_participant')) {
      context.handle(
          _isParticipantMeta,
          isParticipant.isAcceptableOrUnknown(
              data['is_participant']!, _isParticipantMeta));
    }
    if (data.containsKey('num_match')) {
      context.handle(_numMatchMeta,
          numMatch.isAcceptableOrUnknown(data['num_match']!, _numMatchMeta));
    }
    if (data.containsKey('community_id')) {
      context.handle(
          _communityIdMeta,
          communityId.isAcceptableOrUnknown(
              data['community_id']!, _communityIdMeta));
    } else if (isInserting) {
      context.missing(_communityIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Member map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Member(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      sex: $MembersTable.$convertersex.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sex'])!),
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
      isParticipant: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_participant'])!,
      numMatch: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}num_match'])!,
      communityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}community_id'])!,
    );
  }

  @override
  $MembersTable createAlias(String alias) {
    return $MembersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SexEnum, int, int> $convertersex =
      const EnumIndexConverter<SexEnum>(SexEnum.values);
}

class Member extends DataClass implements Insertable<Member> {
  final int id;
  final String name;
  final SexEnum sex;
  final int? age;
  final int level;
  final bool isParticipant;
  final int numMatch;
  final int communityId;
  const Member(
      {required this.id,
      required this.name,
      required this.sex,
      this.age,
      required this.level,
      required this.isParticipant,
      required this.numMatch,
      required this.communityId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      final converter = $MembersTable.$convertersex;
      map['sex'] = Variable<int>(converter.toSql(sex));
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    map['level'] = Variable<int>(level);
    map['is_participant'] = Variable<bool>(isParticipant);
    map['num_match'] = Variable<int>(numMatch);
    map['community_id'] = Variable<int>(communityId);
    return map;
  }

  MembersCompanion toCompanion(bool nullToAbsent) {
    return MembersCompanion(
      id: Value(id),
      name: Value(name),
      sex: Value(sex),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      level: Value(level),
      isParticipant: Value(isParticipant),
      numMatch: Value(numMatch),
      communityId: Value(communityId),
    );
  }

  factory Member.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Member(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sex: $MembersTable.$convertersex
          .fromJson(serializer.fromJson<int>(json['sex'])),
      age: serializer.fromJson<int?>(json['age']),
      level: serializer.fromJson<int>(json['level']),
      isParticipant: serializer.fromJson<bool>(json['isParticipant']),
      numMatch: serializer.fromJson<int>(json['numMatch']),
      communityId: serializer.fromJson<int>(json['communityId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'sex': serializer.toJson<int>($MembersTable.$convertersex.toJson(sex)),
      'age': serializer.toJson<int?>(age),
      'level': serializer.toJson<int>(level),
      'isParticipant': serializer.toJson<bool>(isParticipant),
      'numMatch': serializer.toJson<int>(numMatch),
      'communityId': serializer.toJson<int>(communityId),
    };
  }

  Member copyWith(
          {int? id,
          String? name,
          SexEnum? sex,
          Value<int?> age = const Value.absent(),
          int? level,
          bool? isParticipant,
          int? numMatch,
          int? communityId}) =>
      Member(
        id: id ?? this.id,
        name: name ?? this.name,
        sex: sex ?? this.sex,
        age: age.present ? age.value : this.age,
        level: level ?? this.level,
        isParticipant: isParticipant ?? this.isParticipant,
        numMatch: numMatch ?? this.numMatch,
        communityId: communityId ?? this.communityId,
      );
  @override
  String toString() {
    return (StringBuffer('Member(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sex: $sex, ')
          ..write('age: $age, ')
          ..write('level: $level, ')
          ..write('isParticipant: $isParticipant, ')
          ..write('numMatch: $numMatch, ')
          ..write('communityId: $communityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, sex, age, level, isParticipant, numMatch, communityId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          other.id == this.id &&
          other.name == this.name &&
          other.sex == this.sex &&
          other.age == this.age &&
          other.level == this.level &&
          other.isParticipant == this.isParticipant &&
          other.numMatch == this.numMatch &&
          other.communityId == this.communityId);
}

class MembersCompanion extends UpdateCompanion<Member> {
  final Value<int> id;
  final Value<String> name;
  final Value<SexEnum> sex;
  final Value<int?> age;
  final Value<int> level;
  final Value<bool> isParticipant;
  final Value<int> numMatch;
  final Value<int> communityId;
  const MembersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sex = const Value.absent(),
    this.age = const Value.absent(),
    this.level = const Value.absent(),
    this.isParticipant = const Value.absent(),
    this.numMatch = const Value.absent(),
    this.communityId = const Value.absent(),
  });
  MembersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required SexEnum sex,
    this.age = const Value.absent(),
    required int level,
    this.isParticipant = const Value.absent(),
    this.numMatch = const Value.absent(),
    required int communityId,
  })  : name = Value(name),
        sex = Value(sex),
        level = Value(level),
        communityId = Value(communityId);
  static Insertable<Member> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? sex,
    Expression<int>? age,
    Expression<int>? level,
    Expression<bool>? isParticipant,
    Expression<int>? numMatch,
    Expression<int>? communityId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sex != null) 'sex': sex,
      if (age != null) 'age': age,
      if (level != null) 'level': level,
      if (isParticipant != null) 'is_participant': isParticipant,
      if (numMatch != null) 'num_match': numMatch,
      if (communityId != null) 'community_id': communityId,
    });
  }

  MembersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<SexEnum>? sex,
      Value<int?>? age,
      Value<int>? level,
      Value<bool>? isParticipant,
      Value<int>? numMatch,
      Value<int>? communityId}) {
    return MembersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sex: sex ?? this.sex,
      age: age ?? this.age,
      level: level ?? this.level,
      isParticipant: isParticipant ?? this.isParticipant,
      numMatch: numMatch ?? this.numMatch,
      communityId: communityId ?? this.communityId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sex.present) {
      final converter = $MembersTable.$convertersex;
      map['sex'] = Variable<int>(converter.toSql(sex.value));
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (isParticipant.present) {
      map['is_participant'] = Variable<bool>(isParticipant.value);
    }
    if (numMatch.present) {
      map['num_match'] = Variable<int>(numMatch.value);
    }
    if (communityId.present) {
      map['community_id'] = Variable<int>(communityId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sex: $sex, ')
          ..write('age: $age, ')
          ..write('level: $level, ')
          ..write('isParticipant: $isParticipant, ')
          ..write('numMatch: $numMatch, ')
          ..write('communityId: $communityId')
          ..write(')'))
        .toString();
  }
}

class $MatchesTable extends Matches with TableInfo<$MatchesTable, Match> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MatchesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isSinglesMeta =
      const VerificationMeta('isSingles');
  @override
  late final GeneratedColumn<bool> isSingles =
      GeneratedColumn<bool>('is_singles', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_singles" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _player1IdMeta =
      const VerificationMeta('player1Id');
  @override
  late final GeneratedColumn<int> player1Id = GeneratedColumn<int>(
      'player1_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _player2IdMeta =
      const VerificationMeta('player2Id');
  @override
  late final GeneratedColumn<int> player2Id = GeneratedColumn<int>(
      'player2_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _player3IdMeta =
      const VerificationMeta('player3Id');
  @override
  late final GeneratedColumn<int> player3Id = GeneratedColumn<int>(
      'player3_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _player4IdMeta =
      const VerificationMeta('player4Id');
  @override
  late final GeneratedColumn<int> player4Id = GeneratedColumn<int>(
      'player4_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _communityIdMeta =
      const VerificationMeta('communityId');
  @override
  late final GeneratedColumn<int> communityId = GeneratedColumn<int>(
      'community_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES communities (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, isSingles, player1Id, player2Id, player3Id, player4Id, communityId];
  @override
  String get aliasedName => _alias ?? 'matches';
  @override
  String get actualTableName => 'matches';
  @override
  VerificationContext validateIntegrity(Insertable<Match> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_singles')) {
      context.handle(_isSinglesMeta,
          isSingles.isAcceptableOrUnknown(data['is_singles']!, _isSinglesMeta));
    } else if (isInserting) {
      context.missing(_isSinglesMeta);
    }
    if (data.containsKey('player1_id')) {
      context.handle(_player1IdMeta,
          player1Id.isAcceptableOrUnknown(data['player1_id']!, _player1IdMeta));
    } else if (isInserting) {
      context.missing(_player1IdMeta);
    }
    if (data.containsKey('player2_id')) {
      context.handle(_player2IdMeta,
          player2Id.isAcceptableOrUnknown(data['player2_id']!, _player2IdMeta));
    } else if (isInserting) {
      context.missing(_player2IdMeta);
    }
    if (data.containsKey('player3_id')) {
      context.handle(_player3IdMeta,
          player3Id.isAcceptableOrUnknown(data['player3_id']!, _player3IdMeta));
    } else if (isInserting) {
      context.missing(_player3IdMeta);
    }
    if (data.containsKey('player4_id')) {
      context.handle(_player4IdMeta,
          player4Id.isAcceptableOrUnknown(data['player4_id']!, _player4IdMeta));
    } else if (isInserting) {
      context.missing(_player4IdMeta);
    }
    if (data.containsKey('community_id')) {
      context.handle(
          _communityIdMeta,
          communityId.isAcceptableOrUnknown(
              data['community_id']!, _communityIdMeta));
    } else if (isInserting) {
      context.missing(_communityIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Match map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Match(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isSingles: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_singles'])!,
      player1Id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}player1_id'])!,
      player2Id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}player2_id'])!,
      player3Id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}player3_id'])!,
      player4Id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}player4_id'])!,
      communityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}community_id'])!,
    );
  }

  @override
  $MatchesTable createAlias(String alias) {
    return $MatchesTable(attachedDatabase, alias);
  }
}

class Match extends DataClass implements Insertable<Match> {
  final int id;
  final bool isSingles;
  final int player1Id;
  final int player2Id;
  final int player3Id;
  final int player4Id;
  final int communityId;
  const Match(
      {required this.id,
      required this.isSingles,
      required this.player1Id,
      required this.player2Id,
      required this.player3Id,
      required this.player4Id,
      required this.communityId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_singles'] = Variable<bool>(isSingles);
    map['player1_id'] = Variable<int>(player1Id);
    map['player2_id'] = Variable<int>(player2Id);
    map['player3_id'] = Variable<int>(player3Id);
    map['player4_id'] = Variable<int>(player4Id);
    map['community_id'] = Variable<int>(communityId);
    return map;
  }

  MatchesCompanion toCompanion(bool nullToAbsent) {
    return MatchesCompanion(
      id: Value(id),
      isSingles: Value(isSingles),
      player1Id: Value(player1Id),
      player2Id: Value(player2Id),
      player3Id: Value(player3Id),
      player4Id: Value(player4Id),
      communityId: Value(communityId),
    );
  }

  factory Match.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Match(
      id: serializer.fromJson<int>(json['id']),
      isSingles: serializer.fromJson<bool>(json['isSingles']),
      player1Id: serializer.fromJson<int>(json['player1Id']),
      player2Id: serializer.fromJson<int>(json['player2Id']),
      player3Id: serializer.fromJson<int>(json['player3Id']),
      player4Id: serializer.fromJson<int>(json['player4Id']),
      communityId: serializer.fromJson<int>(json['communityId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isSingles': serializer.toJson<bool>(isSingles),
      'player1Id': serializer.toJson<int>(player1Id),
      'player2Id': serializer.toJson<int>(player2Id),
      'player3Id': serializer.toJson<int>(player3Id),
      'player4Id': serializer.toJson<int>(player4Id),
      'communityId': serializer.toJson<int>(communityId),
    };
  }

  Match copyWith(
          {int? id,
          bool? isSingles,
          int? player1Id,
          int? player2Id,
          int? player3Id,
          int? player4Id,
          int? communityId}) =>
      Match(
        id: id ?? this.id,
        isSingles: isSingles ?? this.isSingles,
        player1Id: player1Id ?? this.player1Id,
        player2Id: player2Id ?? this.player2Id,
        player3Id: player3Id ?? this.player3Id,
        player4Id: player4Id ?? this.player4Id,
        communityId: communityId ?? this.communityId,
      );
  @override
  String toString() {
    return (StringBuffer('Match(')
          ..write('id: $id, ')
          ..write('isSingles: $isSingles, ')
          ..write('player1Id: $player1Id, ')
          ..write('player2Id: $player2Id, ')
          ..write('player3Id: $player3Id, ')
          ..write('player4Id: $player4Id, ')
          ..write('communityId: $communityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, isSingles, player1Id, player2Id, player3Id, player4Id, communityId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Match &&
          other.id == this.id &&
          other.isSingles == this.isSingles &&
          other.player1Id == this.player1Id &&
          other.player2Id == this.player2Id &&
          other.player3Id == this.player3Id &&
          other.player4Id == this.player4Id &&
          other.communityId == this.communityId);
}

class MatchesCompanion extends UpdateCompanion<Match> {
  final Value<int> id;
  final Value<bool> isSingles;
  final Value<int> player1Id;
  final Value<int> player2Id;
  final Value<int> player3Id;
  final Value<int> player4Id;
  final Value<int> communityId;
  const MatchesCompanion({
    this.id = const Value.absent(),
    this.isSingles = const Value.absent(),
    this.player1Id = const Value.absent(),
    this.player2Id = const Value.absent(),
    this.player3Id = const Value.absent(),
    this.player4Id = const Value.absent(),
    this.communityId = const Value.absent(),
  });
  MatchesCompanion.insert({
    this.id = const Value.absent(),
    required bool isSingles,
    required int player1Id,
    required int player2Id,
    required int player3Id,
    required int player4Id,
    required int communityId,
  })  : isSingles = Value(isSingles),
        player1Id = Value(player1Id),
        player2Id = Value(player2Id),
        player3Id = Value(player3Id),
        player4Id = Value(player4Id),
        communityId = Value(communityId);
  static Insertable<Match> custom({
    Expression<int>? id,
    Expression<bool>? isSingles,
    Expression<int>? player1Id,
    Expression<int>? player2Id,
    Expression<int>? player3Id,
    Expression<int>? player4Id,
    Expression<int>? communityId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isSingles != null) 'is_singles': isSingles,
      if (player1Id != null) 'player1_id': player1Id,
      if (player2Id != null) 'player2_id': player2Id,
      if (player3Id != null) 'player3_id': player3Id,
      if (player4Id != null) 'player4_id': player4Id,
      if (communityId != null) 'community_id': communityId,
    });
  }

  MatchesCompanion copyWith(
      {Value<int>? id,
      Value<bool>? isSingles,
      Value<int>? player1Id,
      Value<int>? player2Id,
      Value<int>? player3Id,
      Value<int>? player4Id,
      Value<int>? communityId}) {
    return MatchesCompanion(
      id: id ?? this.id,
      isSingles: isSingles ?? this.isSingles,
      player1Id: player1Id ?? this.player1Id,
      player2Id: player2Id ?? this.player2Id,
      player3Id: player3Id ?? this.player3Id,
      player4Id: player4Id ?? this.player4Id,
      communityId: communityId ?? this.communityId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isSingles.present) {
      map['is_singles'] = Variable<bool>(isSingles.value);
    }
    if (player1Id.present) {
      map['player1_id'] = Variable<int>(player1Id.value);
    }
    if (player2Id.present) {
      map['player2_id'] = Variable<int>(player2Id.value);
    }
    if (player3Id.present) {
      map['player3_id'] = Variable<int>(player3Id.value);
    }
    if (player4Id.present) {
      map['player4_id'] = Variable<int>(player4Id.value);
    }
    if (communityId.present) {
      map['community_id'] = Variable<int>(communityId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MatchesCompanion(')
          ..write('id: $id, ')
          ..write('isSingles: $isSingles, ')
          ..write('player1Id: $player1Id, ')
          ..write('player2Id: $player2Id, ')
          ..write('player3Id: $player3Id, ')
          ..write('player4Id: $player4Id, ')
          ..write('communityId: $communityId')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $CommunitiesTable communities = $CommunitiesTable(this);
  late final $MembersTable members = $MembersTable(this);
  late final $MatchesTable matches = $MatchesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [communities, members, matches];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('communities',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('members', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('communities',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('matches', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

mixin _$CommunityAccessorMixin on DatabaseAccessor<MyDatabase> {
  $CommunitiesTable get communities => attachedDatabase.communities;
}
mixin _$MatchAccessorMixin on DatabaseAccessor<MyDatabase> {
  $CommunitiesTable get communities => attachedDatabase.communities;
  $MatchesTable get matches => attachedDatabase.matches;
}
mixin _$MemberAccessorMixin on DatabaseAccessor<MyDatabase> {
  $CommunitiesTable get communities => attachedDatabase.communities;
  $MembersTable get members => attachedDatabase.members;
}
