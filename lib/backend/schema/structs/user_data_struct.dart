// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataStruct extends FFFirebaseStruct {
  UserDataStruct({
    DateTime? reminderTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _reminderTime = reminderTime,
        super(firestoreUtilData);

  // "reminderTime" field.
  DateTime? _reminderTime;
  DateTime? get reminderTime => _reminderTime;
  set reminderTime(DateTime? val) => _reminderTime = val;
  bool hasReminderTime() => _reminderTime != null;

  static UserDataStruct fromMap(Map<String, dynamic> data) => UserDataStruct(
        reminderTime: data['reminderTime'] as DateTime?,
      );

  static UserDataStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserDataStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'reminderTime': _reminderTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'reminderTime': serializeParam(
          _reminderTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static UserDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDataStruct(
        reminderTime: deserializeParam(
          data['reminderTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'UserDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDataStruct && reminderTime == other.reminderTime;
  }

  @override
  int get hashCode => const ListEquality().hash([reminderTime]);
}

UserDataStruct createUserDataStruct({
  DateTime? reminderTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserDataStruct(
      reminderTime: reminderTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserDataStruct? updateUserDataStruct(
  UserDataStruct? userData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserDataStructData(
  Map<String, dynamic> firestoreData,
  UserDataStruct? userData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userData == null) {
    return;
  }
  if (userData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userDataData = getUserDataFirestoreData(userData, forFieldValue);
  final nestedData = userDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserDataFirestoreData(
  UserDataStruct? userData, [
  bool forFieldValue = false,
]) {
  if (userData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userData.toMap());

  // Add any Firestore field values
  userData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserDataListFirestoreData(
  List<UserDataStruct>? userDatas,
) =>
    userDatas?.map((e) => getUserDataFirestoreData(e, true)).toList() ?? [];
