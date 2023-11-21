// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutineItemStruct extends BaseStruct {
  RoutineItemStruct({
    int? sets,
    int? reps,
    IndividualExerciseStruct? exercise,
  })  : _sets = sets,
        _reps = reps,
        _exercise = exercise;

  // "sets" field.
  int? _sets;
  int get sets => _sets ?? 0;
  set sets(int? val) => _sets = val;
  void incrementSets(int amount) => _sets = sets + amount;
  bool hasSets() => _sets != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  set reps(int? val) => _reps = val;
  void incrementReps(int amount) => _reps = reps + amount;
  bool hasReps() => _reps != null;

  // "exercise" field.
  IndividualExerciseStruct? _exercise;
  IndividualExerciseStruct get exercise =>
      _exercise ?? IndividualExerciseStruct();
  set exercise(IndividualExerciseStruct? val) => _exercise = val;
  void updateExercise(Function(IndividualExerciseStruct) updateFn) =>
      updateFn(_exercise ??= IndividualExerciseStruct());
  bool hasExercise() => _exercise != null;

  static RoutineItemStruct fromMap(Map<String, dynamic> data) =>
      RoutineItemStruct(
        sets: castToType<int>(data['sets']),
        reps: castToType<int>(data['reps']),
        exercise: IndividualExerciseStruct.maybeFromMap(data['exercise']),
      );

  static RoutineItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RoutineItemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'sets': _sets,
        'reps': _reps,
        'exercise': _exercise?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sets': serializeParam(
          _sets,
          ParamType.int,
        ),
        'reps': serializeParam(
          _reps,
          ParamType.int,
        ),
        'exercise': serializeParam(
          _exercise,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static RoutineItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoutineItemStruct(
        sets: deserializeParam(
          data['sets'],
          ParamType.int,
          false,
        ),
        reps: deserializeParam(
          data['reps'],
          ParamType.int,
          false,
        ),
        exercise: deserializeStructParam(
          data['exercise'],
          ParamType.DataStruct,
          false,
          structBuilder: IndividualExerciseStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'RoutineItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoutineItemStruct &&
        sets == other.sets &&
        reps == other.reps &&
        exercise == other.exercise;
  }

  @override
  int get hashCode => const ListEquality().hash([sets, reps, exercise]);
}

RoutineItemStruct createRoutineItemStruct({
  int? sets,
  int? reps,
  IndividualExerciseStruct? exercise,
}) =>
    RoutineItemStruct(
      sets: sets,
      reps: reps,
      exercise: exercise ?? IndividualExerciseStruct(),
    );
