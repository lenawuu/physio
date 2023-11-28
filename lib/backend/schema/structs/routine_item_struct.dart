// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoutineItemStruct extends FFFirebaseStruct {
  RoutineItemStruct({
    int? sets,
    int? reps,
    IndividualExerciseStruct? exercise,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sets = sets,
        _reps = reps,
        _exercise = exercise,
        super(firestoreUtilData);

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RoutineItemStruct(
      sets: sets,
      reps: reps,
      exercise:
          exercise ?? (clearUnsetFields ? IndividualExerciseStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RoutineItemStruct? updateRoutineItemStruct(
  RoutineItemStruct? routineItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    routineItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRoutineItemStructData(
  Map<String, dynamic> firestoreData,
  RoutineItemStruct? routineItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (routineItem == null) {
    return;
  }
  if (routineItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && routineItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final routineItemData =
      getRoutineItemFirestoreData(routineItem, forFieldValue);
  final nestedData =
      routineItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = routineItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRoutineItemFirestoreData(
  RoutineItemStruct? routineItem, [
  bool forFieldValue = false,
]) {
  if (routineItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(routineItem.toMap());

  // Handle nested data for "exercise" field.
  addIndividualExerciseStructData(
    firestoreData,
    routineItem.hasExercise() ? routineItem.exercise : null,
    'exercise',
    forFieldValue,
  );

  // Add any Firestore field values
  routineItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRoutineItemListFirestoreData(
  List<RoutineItemStruct>? routineItems,
) =>
    routineItems?.map((e) => getRoutineItemFirestoreData(e, true)).toList() ??
    [];
