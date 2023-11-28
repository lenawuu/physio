// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IndividualExerciseStruct extends FFFirebaseStruct {
  IndividualExerciseStruct({
    String? title,
    String? directions,
    List<String>? musclesInvolved,
    List<String>? relatedConditions,
    String? url,
    List<String>? muscleGroup,
    String? videoLink,
    String? imageLink,
    String? imageLinkStr,
    bool? isDone,
    Color? myColor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _directions = directions,
        _musclesInvolved = musclesInvolved,
        _relatedConditions = relatedConditions,
        _url = url,
        _muscleGroup = muscleGroup,
        _videoLink = videoLink,
        _imageLink = imageLink,
        _imageLinkStr = imageLinkStr,
        _isDone = isDone,
        _myColor = myColor,
        super(firestoreUtilData);

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "Directions" field.
  String? _directions;
  String get directions => _directions ?? '';
  set directions(String? val) => _directions = val;
  bool hasDirections() => _directions != null;

  // "MusclesInvolved" field.
  List<String>? _musclesInvolved;
  List<String> get musclesInvolved => _musclesInvolved ?? const [];
  set musclesInvolved(List<String>? val) => _musclesInvolved = val;
  void updateMusclesInvolved(Function(List<String>) updateFn) =>
      updateFn(_musclesInvolved ??= []);
  bool hasMusclesInvolved() => _musclesInvolved != null;

  // "RelatedConditions" field.
  List<String>? _relatedConditions;
  List<String> get relatedConditions => _relatedConditions ?? const [];
  set relatedConditions(List<String>? val) => _relatedConditions = val;
  void updateRelatedConditions(Function(List<String>) updateFn) =>
      updateFn(_relatedConditions ??= []);
  bool hasRelatedConditions() => _relatedConditions != null;

  // "URL" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;
  bool hasUrl() => _url != null;

  // "MuscleGroup" field.
  List<String>? _muscleGroup;
  List<String> get muscleGroup => _muscleGroup ?? const [];
  set muscleGroup(List<String>? val) => _muscleGroup = val;
  void updateMuscleGroup(Function(List<String>) updateFn) =>
      updateFn(_muscleGroup ??= []);
  bool hasMuscleGroup() => _muscleGroup != null;

  // "VideoLink" field.
  String? _videoLink;
  String get videoLink => _videoLink ?? '';
  set videoLink(String? val) => _videoLink = val;
  bool hasVideoLink() => _videoLink != null;

  // "ImageLink" field.
  String? _imageLink;
  String get imageLink => _imageLink ?? '';
  set imageLink(String? val) => _imageLink = val;
  bool hasImageLink() => _imageLink != null;

  // "ImageLinkStr" field.
  String? _imageLinkStr;
  String get imageLinkStr => _imageLinkStr ?? '';
  set imageLinkStr(String? val) => _imageLinkStr = val;
  bool hasImageLinkStr() => _imageLinkStr != null;

  // "isDone" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  set isDone(bool? val) => _isDone = val;
  bool hasIsDone() => _isDone != null;

  // "myColor" field.
  Color? _myColor;
  Color? get myColor => _myColor;
  set myColor(Color? val) => _myColor = val;
  bool hasMyColor() => _myColor != null;

  static IndividualExerciseStruct fromMap(Map<String, dynamic> data) =>
      IndividualExerciseStruct(
        title: data['Title'] as String?,
        directions: data['Directions'] as String?,
        musclesInvolved: getDataList(data['MusclesInvolved']),
        relatedConditions: getDataList(data['RelatedConditions']),
        url: data['URL'] as String?,
        muscleGroup: getDataList(data['MuscleGroup']),
        videoLink: data['VideoLink'] as String?,
        imageLink: data['ImageLink'] as String?,
        imageLinkStr: data['ImageLinkStr'] as String?,
        isDone: data['isDone'] as bool?,
        myColor: getSchemaColor(data['myColor']),
      );

  static IndividualExerciseStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? IndividualExerciseStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'Title': _title,
        'Directions': _directions,
        'MusclesInvolved': _musclesInvolved,
        'RelatedConditions': _relatedConditions,
        'URL': _url,
        'MuscleGroup': _muscleGroup,
        'VideoLink': _videoLink,
        'ImageLink': _imageLink,
        'ImageLinkStr': _imageLinkStr,
        'isDone': _isDone,
        'myColor': _myColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'Directions': serializeParam(
          _directions,
          ParamType.String,
        ),
        'MusclesInvolved': serializeParam(
          _musclesInvolved,
          ParamType.String,
          true,
        ),
        'RelatedConditions': serializeParam(
          _relatedConditions,
          ParamType.String,
          true,
        ),
        'URL': serializeParam(
          _url,
          ParamType.String,
        ),
        'MuscleGroup': serializeParam(
          _muscleGroup,
          ParamType.String,
          true,
        ),
        'VideoLink': serializeParam(
          _videoLink,
          ParamType.String,
        ),
        'ImageLink': serializeParam(
          _imageLink,
          ParamType.String,
        ),
        'ImageLinkStr': serializeParam(
          _imageLinkStr,
          ParamType.String,
        ),
        'isDone': serializeParam(
          _isDone,
          ParamType.bool,
        ),
        'myColor': serializeParam(
          _myColor,
          ParamType.Color,
        ),
      }.withoutNulls;

  static IndividualExerciseStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      IndividualExerciseStruct(
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        directions: deserializeParam(
          data['Directions'],
          ParamType.String,
          false,
        ),
        musclesInvolved: deserializeParam<String>(
          data['MusclesInvolved'],
          ParamType.String,
          true,
        ),
        relatedConditions: deserializeParam<String>(
          data['RelatedConditions'],
          ParamType.String,
          true,
        ),
        url: deserializeParam(
          data['URL'],
          ParamType.String,
          false,
        ),
        muscleGroup: deserializeParam<String>(
          data['MuscleGroup'],
          ParamType.String,
          true,
        ),
        videoLink: deserializeParam(
          data['VideoLink'],
          ParamType.String,
          false,
        ),
        imageLink: deserializeParam(
          data['ImageLink'],
          ParamType.String,
          false,
        ),
        imageLinkStr: deserializeParam(
          data['ImageLinkStr'],
          ParamType.String,
          false,
        ),
        isDone: deserializeParam(
          data['isDone'],
          ParamType.bool,
          false,
        ),
        myColor: deserializeParam(
          data['myColor'],
          ParamType.Color,
          false,
        ),
      );

  @override
  String toString() => 'IndividualExerciseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is IndividualExerciseStruct &&
        title == other.title &&
        directions == other.directions &&
        listEquality.equals(musclesInvolved, other.musclesInvolved) &&
        listEquality.equals(relatedConditions, other.relatedConditions) &&
        url == other.url &&
        listEquality.equals(muscleGroup, other.muscleGroup) &&
        videoLink == other.videoLink &&
        imageLink == other.imageLink &&
        imageLinkStr == other.imageLinkStr &&
        isDone == other.isDone &&
        myColor == other.myColor;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        directions,
        musclesInvolved,
        relatedConditions,
        url,
        muscleGroup,
        videoLink,
        imageLink,
        imageLinkStr,
        isDone,
        myColor
      ]);
}

IndividualExerciseStruct createIndividualExerciseStruct({
  String? title,
  String? directions,
  String? url,
  String? videoLink,
  String? imageLink,
  String? imageLinkStr,
  bool? isDone,
  Color? myColor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IndividualExerciseStruct(
      title: title,
      directions: directions,
      url: url,
      videoLink: videoLink,
      imageLink: imageLink,
      imageLinkStr: imageLinkStr,
      isDone: isDone,
      myColor: myColor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IndividualExerciseStruct? updateIndividualExerciseStruct(
  IndividualExerciseStruct? individualExercise, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    individualExercise
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIndividualExerciseStructData(
  Map<String, dynamic> firestoreData,
  IndividualExerciseStruct? individualExercise,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (individualExercise == null) {
    return;
  }
  if (individualExercise.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && individualExercise.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final individualExerciseData =
      getIndividualExerciseFirestoreData(individualExercise, forFieldValue);
  final nestedData =
      individualExerciseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      individualExercise.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIndividualExerciseFirestoreData(
  IndividualExerciseStruct? individualExercise, [
  bool forFieldValue = false,
]) {
  if (individualExercise == null) {
    return {};
  }
  final firestoreData = mapToFirestore(individualExercise.toMap());

  // Add any Firestore field values
  individualExercise.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIndividualExerciseListFirestoreData(
  List<IndividualExerciseStruct>? individualExercises,
) =>
    individualExercises
        ?.map((e) => getIndividualExerciseFirestoreData(e, true))
        .toList() ??
    [];
