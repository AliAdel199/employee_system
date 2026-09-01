// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_info_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOrganizationInfoModelCollection on Isar {
  IsarCollection<OrganizationInfoModel> get organizationInfoModels =>
      this.collection();
}

const OrganizationInfoModelSchema = CollectionSchema(
  name: r'OrganizationInfoModel',
  id: -7208818813449888381,
  properties: {
    r'address': PropertySchema(id: 0, name: r'address', type: IsarType.string),
    r'branchName': PropertySchema(
      id: 1,
      name: r'branchName',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'departmentName': PropertySchema(
      id: 3,
      name: r'departmentName',
      type: IsarType.string,
    ),
    r'email': PropertySchema(id: 4, name: r'email', type: IsarType.string),
    r'logoPath': PropertySchema(
      id: 5,
      name: r'logoPath',
      type: IsarType.string,
    ),
    r'ministryName': PropertySchema(
      id: 6,
      name: r'ministryName',
      type: IsarType.string,
    ),
    r'organizationName': PropertySchema(
      id: 7,
      name: r'organizationName',
      type: IsarType.string,
    ),
    r'phoneNumber': PropertySchema(
      id: 8,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'recordKey': PropertySchema(
      id: 9,
      name: r'recordKey',
      type: IsarType.string,
    ),
    r'reportsFooter': PropertySchema(
      id: 10,
      name: r'reportsFooter',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },
  estimateSize: _organizationInfoModelEstimateSize,
  serialize: _organizationInfoModelSerialize,
  deserialize: _organizationInfoModelDeserialize,
  deserializeProp: _organizationInfoModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'recordKey': IndexSchema(
      id: -1694304532238354687,
      name: r'recordKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'recordKey',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},
  getId: _organizationInfoModelGetId,
  getLinks: _organizationInfoModelGetLinks,
  attach: _organizationInfoModelAttach,
  version: '3.1.0+1',
);

int _organizationInfoModelEstimateSize(
  OrganizationInfoModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address.length * 3;
  bytesCount += 3 + object.branchName.length * 3;
  bytesCount += 3 + object.departmentName.length * 3;
  bytesCount += 3 + object.email.length * 3;
  bytesCount += 3 + object.logoPath.length * 3;
  bytesCount += 3 + object.ministryName.length * 3;
  bytesCount += 3 + object.organizationName.length * 3;
  bytesCount += 3 + object.phoneNumber.length * 3;
  bytesCount += 3 + object.recordKey.length * 3;
  bytesCount += 3 + object.reportsFooter.length * 3;
  return bytesCount;
}

void _organizationInfoModelSerialize(
  OrganizationInfoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeString(offsets[1], object.branchName);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.departmentName);
  writer.writeString(offsets[4], object.email);
  writer.writeString(offsets[5], object.logoPath);
  writer.writeString(offsets[6], object.ministryName);
  writer.writeString(offsets[7], object.organizationName);
  writer.writeString(offsets[8], object.phoneNumber);
  writer.writeString(offsets[9], object.recordKey);
  writer.writeString(offsets[10], object.reportsFooter);
  writer.writeDateTime(offsets[11], object.updatedAt);
}

OrganizationInfoModel _organizationInfoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrganizationInfoModel();
  object.address = reader.readString(offsets[0]);
  object.branchName = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.departmentName = reader.readString(offsets[3]);
  object.email = reader.readString(offsets[4]);
  object.id = id;
  object.logoPath = reader.readString(offsets[5]);
  object.ministryName = reader.readString(offsets[6]);
  object.organizationName = reader.readString(offsets[7]);
  object.phoneNumber = reader.readString(offsets[8]);
  object.recordKey = reader.readString(offsets[9]);
  object.reportsFooter = reader.readString(offsets[10]);
  object.updatedAt = reader.readDateTime(offsets[11]);
  return object;
}

P _organizationInfoModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _organizationInfoModelGetId(OrganizationInfoModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _organizationInfoModelGetLinks(
  OrganizationInfoModel object,
) {
  return [];
}

void _organizationInfoModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  OrganizationInfoModel object,
) {
  object.id = id;
}

extension OrganizationInfoModelByIndex
    on IsarCollection<OrganizationInfoModel> {
  Future<OrganizationInfoModel?> getByRecordKey(String recordKey) {
    return getByIndex(r'recordKey', [recordKey]);
  }

  OrganizationInfoModel? getByRecordKeySync(String recordKey) {
    return getByIndexSync(r'recordKey', [recordKey]);
  }

  Future<bool> deleteByRecordKey(String recordKey) {
    return deleteByIndex(r'recordKey', [recordKey]);
  }

  bool deleteByRecordKeySync(String recordKey) {
    return deleteByIndexSync(r'recordKey', [recordKey]);
  }

  Future<List<OrganizationInfoModel?>> getAllByRecordKey(
    List<String> recordKeyValues,
  ) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'recordKey', values);
  }

  List<OrganizationInfoModel?> getAllByRecordKeySync(
    List<String> recordKeyValues,
  ) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'recordKey', values);
  }

  Future<int> deleteAllByRecordKey(List<String> recordKeyValues) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'recordKey', values);
  }

  int deleteAllByRecordKeySync(List<String> recordKeyValues) {
    final values = recordKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'recordKey', values);
  }

  Future<Id> putByRecordKey(OrganizationInfoModel object) {
    return putByIndex(r'recordKey', object);
  }

  Id putByRecordKeySync(OrganizationInfoModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'recordKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecordKey(List<OrganizationInfoModel> objects) {
    return putAllByIndex(r'recordKey', objects);
  }

  List<Id> putAllByRecordKeySync(
    List<OrganizationInfoModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'recordKey', objects, saveLinks: saveLinks);
  }
}

extension OrganizationInfoModelQueryWhereSort
    on QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QWhere> {
  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhere>
  anyRecordKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'recordKey'),
      );
    });
  }
}

extension OrganizationInfoModelQueryWhere
    on
        QueryBuilder<
          OrganizationInfoModel,
          OrganizationInfoModel,
          QWhereClause
        > {
  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  idNotEqualTo(Id id) {
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

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  recordKeyEqualTo(String recordKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'recordKey', value: [recordKey]),
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  recordKeyNotEqualTo(String recordKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [],
                upper: [recordKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [recordKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [recordKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'recordKey',
                lower: [],
                upper: [recordKey],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  recordKeyGreaterThan(String recordKey, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recordKey',
          lower: [recordKey],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  recordKeyLessThan(String recordKey, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recordKey',
          lower: [],
          upper: [recordKey],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  recordKeyBetween(
    String lowerRecordKey,
    String upperRecordKey, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recordKey',
          lower: [lowerRecordKey],
          includeLower: includeLower,
          upper: [upperRecordKey],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  recordKeyStartsWith(String RecordKeyPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'recordKey',
          lower: [RecordKeyPrefix],
          upper: ['$RecordKeyPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  recordKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'recordKey', value: ['']),
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterWhereClause>
  recordKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'recordKey', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'recordKey',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'recordKey',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'recordKey', upper: ['']),
            );
      }
    });
  }
}

extension OrganizationInfoModelQueryFilter
    on
        QueryBuilder<
          OrganizationInfoModel,
          OrganizationInfoModel,
          QFilterCondition
        > {
  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  addressEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  addressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  addressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  addressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'address',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  addressStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  addressEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'address',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'address',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'address', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'address', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  branchNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'branchName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  branchNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'branchName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  branchNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'branchName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  branchNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'branchName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  branchNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'branchName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  branchNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'branchName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  branchNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'branchName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  branchNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'branchName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  branchNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'branchName', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  branchNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'branchName', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  departmentNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'departmentName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  departmentNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'departmentName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  departmentNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'departmentName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  departmentNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'departmentName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  departmentNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'departmentName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  departmentNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'departmentName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  departmentNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'departmentName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  departmentNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'departmentName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  departmentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'departmentName', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  departmentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'departmentName', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  emailEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  emailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  emailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  emailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'email',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  emailStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  emailEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'email',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'email',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'email', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'email', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  logoPathEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'logoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  logoPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'logoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  logoPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'logoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  logoPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'logoPath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  logoPathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'logoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  logoPathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'logoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  logoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'logoPath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  logoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'logoPath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  logoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'logoPath', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  logoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'logoPath', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  ministryNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ministryName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  ministryNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ministryName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  ministryNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ministryName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  ministryNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ministryName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  ministryNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'ministryName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  ministryNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'ministryName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  ministryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'ministryName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  ministryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'ministryName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  ministryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ministryName', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  ministryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'ministryName', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  organizationNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'organizationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  organizationNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'organizationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  organizationNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'organizationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  organizationNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'organizationName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  organizationNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'organizationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  organizationNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'organizationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  organizationNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'organizationName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  organizationNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'organizationName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  organizationNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'organizationName', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  organizationNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'organizationName', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  phoneNumberEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  phoneNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  phoneNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  phoneNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phoneNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  phoneNumberStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  phoneNumberEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  phoneNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'phoneNumber',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  phoneNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'phoneNumber',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phoneNumber', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'phoneNumber', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  recordKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  recordKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  recordKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  recordKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'recordKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  recordKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  recordKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  recordKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'recordKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  recordKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'recordKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  recordKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'recordKey', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  recordKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'recordKey', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  reportsFooterEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reportsFooter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  reportsFooterGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reportsFooter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  reportsFooterLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reportsFooter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  reportsFooterBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reportsFooter',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  reportsFooterStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'reportsFooter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  reportsFooterEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'reportsFooter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  reportsFooterContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'reportsFooter',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  reportsFooterMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'reportsFooter',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  reportsFooterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reportsFooter', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  reportsFooterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'reportsFooter', value: ''),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    OrganizationInfoModel,
    OrganizationInfoModel,
    QAfterFilterCondition
  >
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension OrganizationInfoModelQueryObject
    on
        QueryBuilder<
          OrganizationInfoModel,
          OrganizationInfoModel,
          QFilterCondition
        > {}

extension OrganizationInfoModelQueryLinks
    on
        QueryBuilder<
          OrganizationInfoModel,
          OrganizationInfoModel,
          QFilterCondition
        > {}

extension OrganizationInfoModelQuerySortBy
    on QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QSortBy> {
  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByBranchName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchName', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByBranchNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchName', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByDepartmentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentName', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByDepartmentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentName', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByMinistryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ministryName', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByMinistryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ministryName', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByOrganizationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationName', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByOrganizationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationName', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByRecordKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByRecordKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByReportsFooter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportsFooter', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByReportsFooterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportsFooter', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension OrganizationInfoModelQuerySortThenBy
    on QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QSortThenBy> {
  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByBranchName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchName', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByBranchNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'branchName', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByDepartmentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentName', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByDepartmentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'departmentName', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByMinistryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ministryName', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByMinistryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ministryName', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByOrganizationName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationName', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByOrganizationNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'organizationName', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByRecordKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByRecordKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordKey', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByReportsFooter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportsFooter', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByReportsFooterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reportsFooter', Sort.desc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension OrganizationInfoModelQueryWhereDistinct
    on QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct> {
  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByBranchName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'branchName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByDepartmentName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'departmentName',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByEmail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByLogoPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByMinistryName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ministryName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByOrganizationName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'organizationName',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByPhoneNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByRecordKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByReportsFooter({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'reportsFooter',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OrganizationInfoModel, OrganizationInfoModel, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension OrganizationInfoModelQueryProperty
    on
        QueryBuilder<
          OrganizationInfoModel,
          OrganizationInfoModel,
          QQueryProperty
        > {
  QueryBuilder<OrganizationInfoModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OrganizationInfoModel, String, QQueryOperations>
  addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<OrganizationInfoModel, String, QQueryOperations>
  branchNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'branchName');
    });
  }

  QueryBuilder<OrganizationInfoModel, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OrganizationInfoModel, String, QQueryOperations>
  departmentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'departmentName');
    });
  }

  QueryBuilder<OrganizationInfoModel, String, QQueryOperations>
  emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<OrganizationInfoModel, String, QQueryOperations>
  logoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logoPath');
    });
  }

  QueryBuilder<OrganizationInfoModel, String, QQueryOperations>
  ministryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ministryName');
    });
  }

  QueryBuilder<OrganizationInfoModel, String, QQueryOperations>
  organizationNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'organizationName');
    });
  }

  QueryBuilder<OrganizationInfoModel, String, QQueryOperations>
  phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }

  QueryBuilder<OrganizationInfoModel, String, QQueryOperations>
  recordKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordKey');
    });
  }

  QueryBuilder<OrganizationInfoModel, String, QQueryOperations>
  reportsFooterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reportsFooter');
    });
  }

  QueryBuilder<OrganizationInfoModel, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
