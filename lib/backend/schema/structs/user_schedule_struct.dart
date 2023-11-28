// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserScheduleStruct extends FFFirebaseStruct {
  UserScheduleStruct({
    int? numDays,
    int? timesPerDay,
    int? daysPerWeek,
    int? numSets,
    int? numReps,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _numDays = numDays,
        _timesPerDay = timesPerDay,
        _daysPerWeek = daysPerWeek,
        _numSets = numSets,
        _numReps = numReps,
        super(firestoreUtilData);

  // "numDays" field.
  int? _numDays;
  int get numDays => _numDays ?? 0;
  set numDays(int? val) => _numDays = val;
  void incrementNumDays(int amount) => _numDays = numDays + amount;
  bool hasNumDays() => _numDays != null;

  // "timesPerDay" field.
  int? _timesPerDay;
  int get timesPerDay => _timesPerDay ?? 0;
  set timesPerDay(int? val) => _timesPerDay = val;
  void incrementTimesPerDay(int amount) => _timesPerDay = timesPerDay + amount;
  bool hasTimesPerDay() => _timesPerDay != null;

  // "daysPerWeek" field.
  int? _daysPerWeek;
  int get daysPerWeek => _daysPerWeek ?? 0;
  set daysPerWeek(int? val) => _daysPerWeek = val;
  void incrementDaysPerWeek(int amount) => _daysPerWeek = daysPerWeek + amount;
  bool hasDaysPerWeek() => _daysPerWeek != null;

  // "numSets" field.
  int? _numSets;
  int get numSets => _numSets ?? 0;
  set numSets(int? val) => _numSets = val;
  void incrementNumSets(int amount) => _numSets = numSets + amount;
  bool hasNumSets() => _numSets != null;

  // "numReps" field.
  int? _numReps;
  int get numReps => _numReps ?? 0;
  set numReps(int? val) => _numReps = val;
  void incrementNumReps(int amount) => _numReps = numReps + amount;
  bool hasNumReps() => _numReps != null;

  static UserScheduleStruct fromMap(Map<String, dynamic> data) =>
      UserScheduleStruct(
        numDays: castToType<int>(data['numDays']),
        timesPerDay: castToType<int>(data['timesPerDay']),
        daysPerWeek: castToType<int>(data['daysPerWeek']),
        numSets: castToType<int>(data['numSets']),
        numReps: castToType<int>(data['numReps']),
      );

  static UserScheduleStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserScheduleStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'numDays': _numDays,
        'timesPerDay': _timesPerDay,
        'daysPerWeek': _daysPerWeek,
        'numSets': _numSets,
        'numReps': _numReps,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'numDays': serializeParam(
          _numDays,
          ParamType.int,
        ),
        'timesPerDay': serializeParam(
          _timesPerDay,
          ParamType.int,
        ),
        'daysPerWeek': serializeParam(
          _daysPerWeek,
          ParamType.int,
        ),
        'numSets': serializeParam(
          _numSets,
          ParamType.int,
        ),
        'numReps': serializeParam(
          _numReps,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserScheduleStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserScheduleStruct(
        numDays: deserializeParam(
          data['numDays'],
          ParamType.int,
          false,
        ),
        timesPerDay: deserializeParam(
          data['timesPerDay'],
          ParamType.int,
          false,
        ),
        daysPerWeek: deserializeParam(
          data['daysPerWeek'],
          ParamType.int,
          false,
        ),
        numSets: deserializeParam(
          data['numSets'],
          ParamType.int,
          false,
        ),
        numReps: deserializeParam(
          data['numReps'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserScheduleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserScheduleStruct &&
        numDays == other.numDays &&
        timesPerDay == other.timesPerDay &&
        daysPerWeek == other.daysPerWeek &&
        numSets == other.numSets &&
        numReps == other.numReps;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([numDays, timesPerDay, daysPerWeek, numSets, numReps]);
}

UserScheduleStruct createUserScheduleStruct({
  int? numDays,
  int? timesPerDay,
  int? daysPerWeek,
  int? numSets,
  int? numReps,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserScheduleStruct(
      numDays: numDays,
      timesPerDay: timesPerDay,
      daysPerWeek: daysPerWeek,
      numSets: numSets,
      numReps: numReps,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserScheduleStruct? updateUserScheduleStruct(
  UserScheduleStruct? userSchedule, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userSchedule
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserScheduleStructData(
  Map<String, dynamic> firestoreData,
  UserScheduleStruct? userSchedule,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userSchedule == null) {
    return;
  }
  if (userSchedule.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userSchedule.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userScheduleData =
      getUserScheduleFirestoreData(userSchedule, forFieldValue);
  final nestedData =
      userScheduleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userSchedule.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserScheduleFirestoreData(
  UserScheduleStruct? userSchedule, [
  bool forFieldValue = false,
]) {
  if (userSchedule == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userSchedule.toMap());

  // Add any Firestore field values
  userSchedule.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserScheduleListFirestoreData(
  List<UserScheduleStruct>? userSchedules,
) =>
    userSchedules?.map((e) => getUserScheduleFirestoreData(e, true)).toList() ??
    [];
