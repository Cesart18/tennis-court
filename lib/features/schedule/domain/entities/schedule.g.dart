// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScheduleCollection on Isar {
  IsarCollection<Schedule> get schedules => this.collection();
}

const ScheduleSchema = CollectionSchema(
  name: r'Schedule',
  id: 6369058706800408146,
  properties: {
    r'endDate': PropertySchema(
      id: 0,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'initialDate': PropertySchema(
      id: 1,
      name: r'initialDate',
      type: IsarType.dateTime,
    ),
    r'userName': PropertySchema(
      id: 2,
      name: r'userName',
      type: IsarType.string,
    )
  },
  estimateSize: _scheduleEstimateSize,
  serialize: _scheduleSerialize,
  deserialize: _scheduleDeserialize,
  deserializeProp: _scheduleDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'courts': LinkSchema(
      id: -8783338300362110384,
      name: r'courts',
      target: r'Court',
      single: false,
      linkName: r'schedules',
    )
  },
  embeddedSchemas: {},
  getId: _scheduleGetId,
  getLinks: _scheduleGetLinks,
  attach: _scheduleAttach,
  version: '3.1.0+1',
);

int _scheduleEstimateSize(
  Schedule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.userName.length * 3;
  return bytesCount;
}

void _scheduleSerialize(
  Schedule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.endDate);
  writer.writeDateTime(offsets[1], object.initialDate);
  writer.writeString(offsets[2], object.userName);
}

Schedule _scheduleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Schedule(
    endDate: reader.readDateTime(offsets[0]),
    initialDate: reader.readDateTime(offsets[1]),
    userName: reader.readString(offsets[2]),
  );
  object.id = id;
  return object;
}

P _scheduleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _scheduleGetId(Schedule object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _scheduleGetLinks(Schedule object) {
  return [object.courts];
}

void _scheduleAttach(IsarCollection<dynamic> col, Id id, Schedule object) {
  object.id = id;
  object.courts.attach(col, col.isar.collection<Court>(), r'courts', id);
}

extension ScheduleQueryWhereSort on QueryBuilder<Schedule, Schedule, QWhere> {
  QueryBuilder<Schedule, Schedule, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScheduleQueryWhere on QueryBuilder<Schedule, Schedule, QWhereClause> {
  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScheduleQueryFilter
    on QueryBuilder<Schedule, Schedule, QFilterCondition> {
  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> initialDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initialDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      initialDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'initialDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> initialDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'initialDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> initialDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'initialDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> userNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userName',
        value: '',
      ));
    });
  }
}

extension ScheduleQueryObject
    on QueryBuilder<Schedule, Schedule, QFilterCondition> {}

extension ScheduleQueryLinks
    on QueryBuilder<Schedule, Schedule, QFilterCondition> {
  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courts(
      FilterQuery<Court> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'courts');
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courtsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courts', length, true, length, true);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courtsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courts', 0, true, 0, true);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courtsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courts', 0, false, 999999, true);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courtsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courts', 0, true, length, include);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      courtsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'courts', length, include, 999999, true);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> courtsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'courts', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ScheduleQuerySortBy on QueryBuilder<Schedule, Schedule, QSortBy> {
  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByInitialDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByInitialDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension ScheduleQuerySortThenBy
    on QueryBuilder<Schedule, Schedule, QSortThenBy> {
  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByInitialDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByInitialDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialDate', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension ScheduleQueryWhereDistinct
    on QueryBuilder<Schedule, Schedule, QDistinct> {
  QueryBuilder<Schedule, Schedule, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByInitialDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initialDate');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByUserName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userName', caseSensitive: caseSensitive);
    });
  }
}

extension ScheduleQueryProperty
    on QueryBuilder<Schedule, Schedule, QQueryProperty> {
  QueryBuilder<Schedule, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Schedule, DateTime, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<Schedule, DateTime, QQueryOperations> initialDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initialDate');
    });
  }

  QueryBuilder<Schedule, String, QQueryOperations> userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userName');
    });
  }
}
