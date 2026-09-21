// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEmployeeModelCollection on Isar {
  IsarCollection<EmployeeModel> get employeeModels => this.collection();
}

const EmployeeModelSchema = CollectionSchema(
  name: r'EmployeeModel',
  id: 8017048509502787200,
  properties: {
    r'address': PropertySchema(
      id: 0,
      name: r'address',
      type: IsarType.string,
    ),
    r'birthDate': PropertySchema(
      id: 1,
      name: r'birthDate',
      type: IsarType.dateTime,
    ),
    r'birthPlace': PropertySchema(
      id: 2,
      name: r'birthPlace',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'currentWorkplace': PropertySchema(
      id: 4,
      name: r'currentWorkplace',
      type: IsarType.string,
    ),
    r'documentsIssueAuthority': PropertySchema(
      id: 5,
      name: r'documentsIssueAuthority',
      type: IsarType.string,
    ),
    r'documentsIssueDate': PropertySchema(
      id: 6,
      name: r'documentsIssueDate',
      type: IsarType.dateTime,
    ),
    r'educationLevel': PropertySchema(
      id: 7,
      name: r'educationLevel',
      type: IsarType.string,
      enumMap: _EmployeeModeleducationLevelEnumValueMap,
    ),
    r'employeeNumber': PropertySchema(
      id: 8,
      name: r'employeeNumber',
      type: IsarType.string,
    ),
    r'fullName': PropertySchema(
      id: 9,
      name: r'fullName',
      type: IsarType.string,
    ),
    r'gender': PropertySchema(
      id: 10,
      name: r'gender',
      type: IsarType.string,
      enumMap: _EmployeeModelgenderEnumValueMap,
    ),
    r'generalNotes': PropertySchema(
      id: 11,
      name: r'generalNotes',
      type: IsarType.string,
    ),
    r'housingCardNumber': PropertySchema(
      id: 12,
      name: r'housingCardNumber',
      type: IsarType.string,
    ),
    r'jobNotes': PropertySchema(
      id: 13,
      name: r'jobNotes',
      type: IsarType.string,
    ),
    r'jobTitle': PropertySchema(
      id: 14,
      name: r'jobTitle',
      type: IsarType.string,
    ),
    r'maritalStatus': PropertySchema(
      id: 15,
      name: r'maritalStatus',
      type: IsarType.string,
      enumMap: _EmployeeModelmaritalStatusEnumValueMap,
    ),
    r'nationalCardNumber': PropertySchema(
      id: 16,
      name: r'nationalCardNumber',
      type: IsarType.string,
    ),
    r'nationalNumber': PropertySchema(
      id: 17,
      name: r'nationalNumber',
      type: IsarType.string,
    ),
    r'phoneNumber': PropertySchema(
      id: 18,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'photoPath': PropertySchema(
      id: 19,
      name: r'photoPath',
      type: IsarType.string,
    ),
    r'previousWorkplace': PropertySchema(
      id: 20,
      name: r'previousWorkplace',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 21,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _employeeModelEstimateSize,
  serialize: _employeeModelSerialize,
  deserialize: _employeeModelDeserialize,
  deserializeProp: _employeeModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'fullName': IndexSchema(
      id: 8863244454116476334,
      name: r'fullName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fullName',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'phoneNumber': IndexSchema(
      id: 5414128966131364535,
      name: r'phoneNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'phoneNumber',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'nationalNumber': IndexSchema(
      id: -3469076831644430275,
      name: r'nationalNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nationalNumber',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'nationalCardNumber': IndexSchema(
      id: -5178679489330550817,
      name: r'nationalCardNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nationalCardNumber',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'housingCardNumber': IndexSchema(
      id: -326812186636511291,
      name: r'housingCardNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'housingCardNumber',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'employeeNumber': IndexSchema(
      id: 4763097555639195826,
      name: r'employeeNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'employeeNumber',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'jobTitle': IndexSchema(
      id: 3642190969293510384,
      name: r'jobTitle',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'jobTitle',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'currentWorkplace': IndexSchema(
      id: -5784455729941292802,
      name: r'currentWorkplace',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'currentWorkplace',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'previousWorkplace': IndexSchema(
      id: -1518721245052417134,
      name: r'previousWorkplace',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'previousWorkplace',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _employeeModelGetId,
  getLinks: _employeeModelGetLinks,
  attach: _employeeModelAttach,
  version: '3.1.0+1',
);

int _employeeModelEstimateSize(
  EmployeeModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.address.length * 3;
  bytesCount += 3 + object.birthPlace.length * 3;
  bytesCount += 3 + object.currentWorkplace.length * 3;
  bytesCount += 3 + object.documentsIssueAuthority.length * 3;
  {
    final value = object.educationLevel;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  bytesCount += 3 + object.employeeNumber.length * 3;
  bytesCount += 3 + object.fullName.length * 3;
  {
    final value = object.gender;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  bytesCount += 3 + object.generalNotes.length * 3;
  bytesCount += 3 + object.housingCardNumber.length * 3;
  bytesCount += 3 + object.jobNotes.length * 3;
  bytesCount += 3 + object.jobTitle.length * 3;
  {
    final value = object.maritalStatus;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  bytesCount += 3 + object.nationalCardNumber.length * 3;
  bytesCount += 3 + object.nationalNumber.length * 3;
  bytesCount += 3 + object.phoneNumber.length * 3;
  bytesCount += 3 + object.photoPath.length * 3;
  bytesCount += 3 + object.previousWorkplace.length * 3;
  return bytesCount;
}

void _employeeModelSerialize(
  EmployeeModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.address);
  writer.writeDateTime(offsets[1], object.birthDate);
  writer.writeString(offsets[2], object.birthPlace);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.currentWorkplace);
  writer.writeString(offsets[5], object.documentsIssueAuthority);
  writer.writeDateTime(offsets[6], object.documentsIssueDate);
  writer.writeString(offsets[7], object.educationLevel?.name);
  writer.writeString(offsets[8], object.employeeNumber);
  writer.writeString(offsets[9], object.fullName);
  writer.writeString(offsets[10], object.gender?.name);
  writer.writeString(offsets[11], object.generalNotes);
  writer.writeString(offsets[12], object.housingCardNumber);
  writer.writeString(offsets[13], object.jobNotes);
  writer.writeString(offsets[14], object.jobTitle);
  writer.writeString(offsets[15], object.maritalStatus?.name);
  writer.writeString(offsets[16], object.nationalCardNumber);
  writer.writeString(offsets[17], object.nationalNumber);
  writer.writeString(offsets[18], object.phoneNumber);
  writer.writeString(offsets[19], object.photoPath);
  writer.writeString(offsets[20], object.previousWorkplace);
  writer.writeDateTime(offsets[21], object.updatedAt);
}

EmployeeModel _employeeModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EmployeeModel();
  object.address = reader.readString(offsets[0]);
  object.birthDate = reader.readDateTimeOrNull(offsets[1]);
  object.birthPlace = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.currentWorkplace = reader.readString(offsets[4]);
  object.documentsIssueAuthority = reader.readString(offsets[5]);
  object.documentsIssueDate = reader.readDateTimeOrNull(offsets[6]);
  object.educationLevel = _EmployeeModeleducationLevelValueEnumMap[
      reader.readStringOrNull(offsets[7])];
  object.employeeNumber = reader.readString(offsets[8]);
  object.fullName = reader.readString(offsets[9]);
  object.gender =
      _EmployeeModelgenderValueEnumMap[reader.readStringOrNull(offsets[10])];
  object.generalNotes = reader.readString(offsets[11]);
  object.housingCardNumber = reader.readString(offsets[12]);
  object.id = id;
  object.jobNotes = reader.readString(offsets[13]);
  object.jobTitle = reader.readString(offsets[14]);
  object.maritalStatus = _EmployeeModelmaritalStatusValueEnumMap[
      reader.readStringOrNull(offsets[15])];
  object.nationalCardNumber = reader.readString(offsets[16]);
  object.nationalNumber = reader.readString(offsets[17]);
  object.phoneNumber = reader.readString(offsets[18]);
  object.photoPath = reader.readString(offsets[19]);
  object.previousWorkplace = reader.readString(offsets[20]);
  object.updatedAt = reader.readDateTime(offsets[21]);
  return object;
}

P _employeeModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (_EmployeeModeleducationLevelValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (_EmployeeModelgenderValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (_EmployeeModelmaritalStatusValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    case 19:
      return (reader.readString(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _EmployeeModeleducationLevelEnumValueMap = {
  r'primary': r'primary',
  r'intermediate': r'intermediate',
  r'secondary': r'secondary',
  r'diploma': r'diploma',
  r'bachelor': r'bachelor',
  r'master': r'master',
  r'doctorate': r'doctorate',
  r'other': r'other',
};
const _EmployeeModeleducationLevelValueEnumMap = {
  r'primary': EducationLevel.primary,
  r'intermediate': EducationLevel.intermediate,
  r'secondary': EducationLevel.secondary,
  r'diploma': EducationLevel.diploma,
  r'bachelor': EducationLevel.bachelor,
  r'master': EducationLevel.master,
  r'doctorate': EducationLevel.doctorate,
  r'other': EducationLevel.other,
};
const _EmployeeModelgenderEnumValueMap = {
  r'male': r'male',
  r'female': r'female',
};
const _EmployeeModelgenderValueEnumMap = {
  r'male': Gender.male,
  r'female': Gender.female,
};
const _EmployeeModelmaritalStatusEnumValueMap = {
  r'single': r'single',
  r'married': r'married',
  r'divorced': r'divorced',
  r'widowed': r'widowed',
};
const _EmployeeModelmaritalStatusValueEnumMap = {
  r'single': MaritalStatus.single,
  r'married': MaritalStatus.married,
  r'divorced': MaritalStatus.divorced,
  r'widowed': MaritalStatus.widowed,
};

Id _employeeModelGetId(EmployeeModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _employeeModelGetLinks(EmployeeModel object) {
  return [];
}

void _employeeModelAttach(
    IsarCollection<dynamic> col, Id id, EmployeeModel object) {
  object.id = id;
}

extension EmployeeModelQueryWhereSort
    on QueryBuilder<EmployeeModel, EmployeeModel, QWhere> {
  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhere> anyFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'fullName'),
      );
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhere> anyPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'phoneNumber'),
      );
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhere> anyNationalNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'nationalNumber'),
      );
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhere>
      anyNationalCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'nationalCardNumber'),
      );
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhere>
      anyHousingCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'housingCardNumber'),
      );
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhere> anyEmployeeNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'employeeNumber'),
      );
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhere> anyJobTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'jobTitle'),
      );
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhere>
      anyCurrentWorkplace() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'currentWorkplace'),
      );
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhere>
      anyPreviousWorkplace() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'previousWorkplace'),
      );
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension EmployeeModelQueryWhere
    on QueryBuilder<EmployeeModel, EmployeeModel, QWhereClause> {
  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause> fullNameEqualTo(
      String fullName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fullName',
        value: [fullName],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      fullNameNotEqualTo(String fullName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fullName',
              lower: [],
              upper: [fullName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fullName',
              lower: [fullName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fullName',
              lower: [fullName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fullName',
              lower: [],
              upper: [fullName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      fullNameGreaterThan(
    String fullName, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fullName',
        lower: [fullName],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      fullNameLessThan(
    String fullName, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fullName',
        lower: [],
        upper: [fullName],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause> fullNameBetween(
    String lowerFullName,
    String upperFullName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fullName',
        lower: [lowerFullName],
        includeLower: includeLower,
        upper: [upperFullName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      fullNameStartsWith(String FullNamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fullName',
        lower: [FullNamePrefix],
        upper: ['$FullNamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fullName',
        value: [''],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'fullName',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'fullName',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'fullName',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'fullName',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      phoneNumberEqualTo(String phoneNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'phoneNumber',
        value: [phoneNumber],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      phoneNumberNotEqualTo(String phoneNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phoneNumber',
              lower: [],
              upper: [phoneNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phoneNumber',
              lower: [phoneNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phoneNumber',
              lower: [phoneNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phoneNumber',
              lower: [],
              upper: [phoneNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      phoneNumberGreaterThan(
    String phoneNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'phoneNumber',
        lower: [phoneNumber],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      phoneNumberLessThan(
    String phoneNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'phoneNumber',
        lower: [],
        upper: [phoneNumber],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      phoneNumberBetween(
    String lowerPhoneNumber,
    String upperPhoneNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'phoneNumber',
        lower: [lowerPhoneNumber],
        includeLower: includeLower,
        upper: [upperPhoneNumber],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      phoneNumberStartsWith(String PhoneNumberPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'phoneNumber',
        lower: [PhoneNumberPrefix],
        upper: ['$PhoneNumberPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'phoneNumber',
        value: [''],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'phoneNumber',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'phoneNumber',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'phoneNumber',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'phoneNumber',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalNumberEqualTo(String nationalNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nationalNumber',
        value: [nationalNumber],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalNumberNotEqualTo(String nationalNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalNumber',
              lower: [],
              upper: [nationalNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalNumber',
              lower: [nationalNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalNumber',
              lower: [nationalNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalNumber',
              lower: [],
              upper: [nationalNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalNumberGreaterThan(
    String nationalNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nationalNumber',
        lower: [nationalNumber],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalNumberLessThan(
    String nationalNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nationalNumber',
        lower: [],
        upper: [nationalNumber],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalNumberBetween(
    String lowerNationalNumber,
    String upperNationalNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nationalNumber',
        lower: [lowerNationalNumber],
        includeLower: includeLower,
        upper: [upperNationalNumber],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalNumberStartsWith(String NationalNumberPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nationalNumber',
        lower: [NationalNumberPrefix],
        upper: ['$NationalNumberPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nationalNumber',
        value: [''],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'nationalNumber',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'nationalNumber',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'nationalNumber',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'nationalNumber',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalCardNumberEqualTo(String nationalCardNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nationalCardNumber',
        value: [nationalCardNumber],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalCardNumberNotEqualTo(String nationalCardNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalCardNumber',
              lower: [],
              upper: [nationalCardNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalCardNumber',
              lower: [nationalCardNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalCardNumber',
              lower: [nationalCardNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nationalCardNumber',
              lower: [],
              upper: [nationalCardNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalCardNumberGreaterThan(
    String nationalCardNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nationalCardNumber',
        lower: [nationalCardNumber],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalCardNumberLessThan(
    String nationalCardNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nationalCardNumber',
        lower: [],
        upper: [nationalCardNumber],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalCardNumberBetween(
    String lowerNationalCardNumber,
    String upperNationalCardNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nationalCardNumber',
        lower: [lowerNationalCardNumber],
        includeLower: includeLower,
        upper: [upperNationalCardNumber],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalCardNumberStartsWith(String NationalCardNumberPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'nationalCardNumber',
        lower: [NationalCardNumberPrefix],
        upper: ['$NationalCardNumberPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalCardNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nationalCardNumber',
        value: [''],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      nationalCardNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'nationalCardNumber',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'nationalCardNumber',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'nationalCardNumber',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'nationalCardNumber',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      housingCardNumberEqualTo(String housingCardNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'housingCardNumber',
        value: [housingCardNumber],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      housingCardNumberNotEqualTo(String housingCardNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'housingCardNumber',
              lower: [],
              upper: [housingCardNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'housingCardNumber',
              lower: [housingCardNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'housingCardNumber',
              lower: [housingCardNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'housingCardNumber',
              lower: [],
              upper: [housingCardNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      housingCardNumberGreaterThan(
    String housingCardNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'housingCardNumber',
        lower: [housingCardNumber],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      housingCardNumberLessThan(
    String housingCardNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'housingCardNumber',
        lower: [],
        upper: [housingCardNumber],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      housingCardNumberBetween(
    String lowerHousingCardNumber,
    String upperHousingCardNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'housingCardNumber',
        lower: [lowerHousingCardNumber],
        includeLower: includeLower,
        upper: [upperHousingCardNumber],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      housingCardNumberStartsWith(String HousingCardNumberPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'housingCardNumber',
        lower: [HousingCardNumberPrefix],
        upper: ['$HousingCardNumberPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      housingCardNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'housingCardNumber',
        value: [''],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      housingCardNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'housingCardNumber',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'housingCardNumber',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'housingCardNumber',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'housingCardNumber',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      employeeNumberEqualTo(String employeeNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'employeeNumber',
        value: [employeeNumber],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      employeeNumberNotEqualTo(String employeeNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'employeeNumber',
              lower: [],
              upper: [employeeNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'employeeNumber',
              lower: [employeeNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'employeeNumber',
              lower: [employeeNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'employeeNumber',
              lower: [],
              upper: [employeeNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      employeeNumberGreaterThan(
    String employeeNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'employeeNumber',
        lower: [employeeNumber],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      employeeNumberLessThan(
    String employeeNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'employeeNumber',
        lower: [],
        upper: [employeeNumber],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      employeeNumberBetween(
    String lowerEmployeeNumber,
    String upperEmployeeNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'employeeNumber',
        lower: [lowerEmployeeNumber],
        includeLower: includeLower,
        upper: [upperEmployeeNumber],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      employeeNumberStartsWith(String EmployeeNumberPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'employeeNumber',
        lower: [EmployeeNumberPrefix],
        upper: ['$EmployeeNumberPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      employeeNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'employeeNumber',
        value: [''],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      employeeNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'employeeNumber',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'employeeNumber',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'employeeNumber',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'employeeNumber',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause> jobTitleEqualTo(
      String jobTitle) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'jobTitle',
        value: [jobTitle],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      jobTitleNotEqualTo(String jobTitle) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobTitle',
              lower: [],
              upper: [jobTitle],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobTitle',
              lower: [jobTitle],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobTitle',
              lower: [jobTitle],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'jobTitle',
              lower: [],
              upper: [jobTitle],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      jobTitleGreaterThan(
    String jobTitle, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'jobTitle',
        lower: [jobTitle],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      jobTitleLessThan(
    String jobTitle, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'jobTitle',
        lower: [],
        upper: [jobTitle],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause> jobTitleBetween(
    String lowerJobTitle,
    String upperJobTitle, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'jobTitle',
        lower: [lowerJobTitle],
        includeLower: includeLower,
        upper: [upperJobTitle],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      jobTitleStartsWith(String JobTitlePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'jobTitle',
        lower: [JobTitlePrefix],
        upper: ['$JobTitlePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      jobTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'jobTitle',
        value: [''],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      jobTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'jobTitle',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'jobTitle',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'jobTitle',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'jobTitle',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      currentWorkplaceEqualTo(String currentWorkplace) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'currentWorkplace',
        value: [currentWorkplace],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      currentWorkplaceNotEqualTo(String currentWorkplace) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'currentWorkplace',
              lower: [],
              upper: [currentWorkplace],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'currentWorkplace',
              lower: [currentWorkplace],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'currentWorkplace',
              lower: [currentWorkplace],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'currentWorkplace',
              lower: [],
              upper: [currentWorkplace],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      currentWorkplaceGreaterThan(
    String currentWorkplace, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'currentWorkplace',
        lower: [currentWorkplace],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      currentWorkplaceLessThan(
    String currentWorkplace, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'currentWorkplace',
        lower: [],
        upper: [currentWorkplace],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      currentWorkplaceBetween(
    String lowerCurrentWorkplace,
    String upperCurrentWorkplace, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'currentWorkplace',
        lower: [lowerCurrentWorkplace],
        includeLower: includeLower,
        upper: [upperCurrentWorkplace],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      currentWorkplaceStartsWith(String CurrentWorkplacePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'currentWorkplace',
        lower: [CurrentWorkplacePrefix],
        upper: ['$CurrentWorkplacePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      currentWorkplaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'currentWorkplace',
        value: [''],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      currentWorkplaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'currentWorkplace',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'currentWorkplace',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'currentWorkplace',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'currentWorkplace',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      previousWorkplaceEqualTo(String previousWorkplace) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'previousWorkplace',
        value: [previousWorkplace],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      previousWorkplaceNotEqualTo(String previousWorkplace) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'previousWorkplace',
              lower: [],
              upper: [previousWorkplace],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'previousWorkplace',
              lower: [previousWorkplace],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'previousWorkplace',
              lower: [previousWorkplace],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'previousWorkplace',
              lower: [],
              upper: [previousWorkplace],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      previousWorkplaceGreaterThan(
    String previousWorkplace, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'previousWorkplace',
        lower: [previousWorkplace],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      previousWorkplaceLessThan(
    String previousWorkplace, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'previousWorkplace',
        lower: [],
        upper: [previousWorkplace],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      previousWorkplaceBetween(
    String lowerPreviousWorkplace,
    String upperPreviousWorkplace, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'previousWorkplace',
        lower: [lowerPreviousWorkplace],
        includeLower: includeLower,
        upper: [upperPreviousWorkplace],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      previousWorkplaceStartsWith(String PreviousWorkplacePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'previousWorkplace',
        lower: [PreviousWorkplacePrefix],
        upper: ['$PreviousWorkplacePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      previousWorkplaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'previousWorkplace',
        value: [''],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      previousWorkplaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'previousWorkplace',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'previousWorkplace',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'previousWorkplace',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'previousWorkplace',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      createdAtEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      createdAtNotEqualTo(DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      createdAtLessThan(
    DateTime createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterWhereClause>
      createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EmployeeModelQueryFilter
    on QueryBuilder<EmployeeModel, EmployeeModel, QFilterCondition> {
  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      addressEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      addressGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      addressLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      addressBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'birthDate',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'birthDate',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birthDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthPlaceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthPlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthPlaceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birthPlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthPlaceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birthPlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthPlaceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birthPlace',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthPlaceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'birthPlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthPlaceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'birthPlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthPlaceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'birthPlace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthPlaceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'birthPlace',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthPlaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthPlace',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      birthPlaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'birthPlace',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      currentWorkplaceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      currentWorkplaceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      currentWorkplaceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      currentWorkplaceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentWorkplace',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      currentWorkplaceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currentWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      currentWorkplaceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currentWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      currentWorkplaceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currentWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      currentWorkplaceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currentWorkplace',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      currentWorkplaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentWorkplace',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      currentWorkplaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currentWorkplace',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueAuthorityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentsIssueAuthority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueAuthorityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentsIssueAuthority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueAuthorityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentsIssueAuthority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueAuthorityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentsIssueAuthority',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueAuthorityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'documentsIssueAuthority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueAuthorityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'documentsIssueAuthority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueAuthorityContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'documentsIssueAuthority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueAuthorityMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'documentsIssueAuthority',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueAuthorityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentsIssueAuthority',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueAuthorityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'documentsIssueAuthority',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'documentsIssueDate',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'documentsIssueDate',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'documentsIssueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'documentsIssueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'documentsIssueDate',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      documentsIssueDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'documentsIssueDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'educationLevel',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'educationLevel',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelEqualTo(
    EducationLevel? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelGreaterThan(
    EducationLevel? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelLessThan(
    EducationLevel? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelBetween(
    EducationLevel? lower,
    EducationLevel? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'educationLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'educationLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'educationLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'educationLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      educationLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'educationLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      employeeNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      employeeNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      employeeNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      employeeNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      employeeNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'employeeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      employeeNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'employeeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      employeeNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'employeeNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      employeeNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'employeeNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      employeeNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      employeeNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'employeeNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      fullNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      fullNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      fullNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      fullNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      fullNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      fullNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      fullNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      fullNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      fullNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      fullNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullName',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gender',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderEqualTo(
    Gender? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderGreaterThan(
    Gender? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderLessThan(
    Gender? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderBetween(
    Gender? lower,
    Gender? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      genderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gender',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      generalNotesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generalNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      generalNotesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generalNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      generalNotesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generalNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      generalNotesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generalNotes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      generalNotesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'generalNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      generalNotesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'generalNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      generalNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'generalNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      generalNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'generalNotes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      generalNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generalNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      generalNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'generalNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      housingCardNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'housingCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      housingCardNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'housingCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      housingCardNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'housingCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      housingCardNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'housingCardNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      housingCardNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'housingCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      housingCardNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'housingCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      housingCardNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'housingCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      housingCardNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'housingCardNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      housingCardNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'housingCardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      housingCardNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'housingCardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
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

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobNotesEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobNotesGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobNotesLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobNotesBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobNotes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobNotesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobNotesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobNotes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      jobTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'maritalStatus',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'maritalStatus',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusEqualTo(
    MaritalStatus? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusGreaterThan(
    MaritalStatus? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusLessThan(
    MaritalStatus? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusBetween(
    MaritalStatus? lower,
    MaritalStatus? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maritalStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'maritalStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'maritalStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maritalStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      maritalStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'maritalStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalCardNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationalCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalCardNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nationalCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalCardNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nationalCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalCardNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nationalCardNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalCardNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nationalCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalCardNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nationalCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalCardNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nationalCardNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalCardNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nationalCardNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalCardNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationalCardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalCardNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nationalCardNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationalNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nationalNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nationalNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nationalNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nationalNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nationalNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nationalNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nationalNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nationalNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      nationalNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nationalNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      phoneNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      phoneNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      phoneNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      phoneNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      phoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      phoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      phoneNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      phoneNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      photoPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      photoPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      photoPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      photoPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      photoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      photoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      photoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      photoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      photoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      photoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      previousWorkplaceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previousWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      previousWorkplaceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'previousWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      previousWorkplaceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'previousWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      previousWorkplaceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'previousWorkplace',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      previousWorkplaceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'previousWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      previousWorkplaceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'previousWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      previousWorkplaceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'previousWorkplace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      previousWorkplaceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'previousWorkplace',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      previousWorkplaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previousWorkplace',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      previousWorkplaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'previousWorkplace',
        value: '',
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EmployeeModelQueryObject
    on QueryBuilder<EmployeeModel, EmployeeModel, QFilterCondition> {}

extension EmployeeModelQueryLinks
    on QueryBuilder<EmployeeModel, EmployeeModel, QFilterCondition> {}

extension EmployeeModelQuerySortBy
    on QueryBuilder<EmployeeModel, EmployeeModel, QSortBy> {
  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByBirthPlace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthPlace', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByBirthPlaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthPlace', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByCurrentWorkplace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWorkplace', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByCurrentWorkplaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWorkplace', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByDocumentsIssueAuthority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentsIssueAuthority', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByDocumentsIssueAuthorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentsIssueAuthority', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByDocumentsIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentsIssueDate', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByDocumentsIssueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentsIssueDate', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByEducationLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByEducationLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByEmployeeNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeNumber', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByEmployeeNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeNumber', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByGeneralNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalNotes', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByGeneralNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalNotes', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByHousingCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'housingCardNumber', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByHousingCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'housingCardNumber', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByJobNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobNotes', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByJobNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobNotes', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByJobTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByJobTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByMaritalStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maritalStatus', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByMaritalStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maritalStatus', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByNationalCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalCardNumber', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByNationalCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalCardNumber', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByNationalNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalNumber', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByNationalNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalNumber', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByPreviousWorkplace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousWorkplace', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByPreviousWorkplaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousWorkplace', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension EmployeeModelQuerySortThenBy
    on QueryBuilder<EmployeeModel, EmployeeModel, QSortThenBy> {
  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByBirthPlace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthPlace', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByBirthPlaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthPlace', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByCurrentWorkplace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWorkplace', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByCurrentWorkplaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentWorkplace', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByDocumentsIssueAuthority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentsIssueAuthority', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByDocumentsIssueAuthorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentsIssueAuthority', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByDocumentsIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentsIssueDate', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByDocumentsIssueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'documentsIssueDate', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByEducationLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByEducationLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'educationLevel', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByEmployeeNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeNumber', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByEmployeeNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeNumber', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByFullName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByFullNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullName', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gender', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByGeneralNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalNotes', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByGeneralNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generalNotes', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByHousingCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'housingCardNumber', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByHousingCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'housingCardNumber', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByJobNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobNotes', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByJobNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobNotes', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByJobTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByJobTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobTitle', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByMaritalStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maritalStatus', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByMaritalStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maritalStatus', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByNationalCardNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalCardNumber', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByNationalCardNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalCardNumber', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByNationalNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalNumber', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByNationalNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nationalNumber', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByPhotoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByPhotoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoPath', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByPreviousWorkplace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousWorkplace', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByPreviousWorkplaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'previousWorkplace', Sort.desc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension EmployeeModelQueryWhereDistinct
    on QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> {
  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthDate');
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByBirthPlace(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthPlace', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct>
      distinctByCurrentWorkplace({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentWorkplace',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct>
      distinctByDocumentsIssueAuthority({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentsIssueAuthority',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct>
      distinctByDocumentsIssueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'documentsIssueDate');
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct>
      distinctByEducationLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'educationLevel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct>
      distinctByEmployeeNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByFullName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByGeneralNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generalNotes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct>
      distinctByHousingCardNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'housingCardNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByJobNotes(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobNotes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByJobTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByMaritalStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maritalStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct>
      distinctByNationalCardNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nationalCardNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct>
      distinctByNationalNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nationalNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByPhotoPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct>
      distinctByPreviousWorkplace({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'previousWorkplace',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EmployeeModel, EmployeeModel, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension EmployeeModelQueryProperty
    on QueryBuilder<EmployeeModel, EmployeeModel, QQueryProperty> {
  QueryBuilder<EmployeeModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations> addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<EmployeeModel, DateTime?, QQueryOperations> birthDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthDate');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations> birthPlaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthPlace');
    });
  }

  QueryBuilder<EmployeeModel, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations>
      currentWorkplaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentWorkplace');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations>
      documentsIssueAuthorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentsIssueAuthority');
    });
  }

  QueryBuilder<EmployeeModel, DateTime?, QQueryOperations>
      documentsIssueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'documentsIssueDate');
    });
  }

  QueryBuilder<EmployeeModel, EducationLevel?, QQueryOperations>
      educationLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'educationLevel');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations>
      employeeNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeNumber');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations> fullNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullName');
    });
  }

  QueryBuilder<EmployeeModel, Gender?, QQueryOperations> genderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gender');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations> generalNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generalNotes');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations>
      housingCardNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'housingCardNumber');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations> jobNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobNotes');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations> jobTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobTitle');
    });
  }

  QueryBuilder<EmployeeModel, MaritalStatus?, QQueryOperations>
      maritalStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maritalStatus');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations>
      nationalCardNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nationalCardNumber');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations>
      nationalNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nationalNumber');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations> phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations> photoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoPath');
    });
  }

  QueryBuilder<EmployeeModel, String, QQueryOperations>
      previousWorkplaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'previousWorkplace');
    });
  }

  QueryBuilder<EmployeeModel, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
