// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserScheduleStruct extends BaseStruct {
  UserScheduleStruct({
    int? numDays,
    int? timesPerDay,
    int? daysPerWeek,
    int? numSets,
    int? numReps,
  })  : _numDays = numDays,
        _timesPerDay = timesPerDay,
        _daysPerWeek = daysPerWeek,
        _numSets = numSets,
        _numReps = numReps;

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
}) =>
    UserScheduleStruct(
      numDays: numDays,
      timesPerDay: timesPerDay,
      daysPerWeek: daysPerWeek,
      numSets: numSets,
      numReps: numReps,
    );
