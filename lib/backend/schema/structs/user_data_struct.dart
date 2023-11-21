// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataStruct extends BaseStruct {
  UserDataStruct({
    DateTime? reminderTime,
  }) : _reminderTime = reminderTime;

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
}) =>
    UserDataStruct(
      reminderTime: reminderTime,
    );
