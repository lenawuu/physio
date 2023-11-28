// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VPathExStruct extends FFFirebaseStruct {
  VPathExStruct({
    String? title,
    String? directions,
    List<String>? musclesInvolved,
    List<String>? relatedConditions,
    String? imageLink,
    String? url,
    List<String>? muscleGroup,
    String? videoLink,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _directions = directions,
        _musclesInvolved = musclesInvolved,
        _relatedConditions = relatedConditions,
        _imageLink = imageLink,
        _url = url,
        _muscleGroup = muscleGroup,
        _videoLink = videoLink,
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

  // "ImageLink" field.
  String? _imageLink;
  String get imageLink => _imageLink ?? '';
  set imageLink(String? val) => _imageLink = val;
  bool hasImageLink() => _imageLink != null;

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

  static VPathExStruct fromMap(Map<String, dynamic> data) => VPathExStruct(
        title: data['Title'] as String?,
        directions: data['Directions'] as String?,
        musclesInvolved: getDataList(data['MusclesInvolved']),
        relatedConditions: getDataList(data['RelatedConditions']),
        imageLink: data['ImageLink'] as String?,
        url: data['URL'] as String?,
        muscleGroup: getDataList(data['MuscleGroup']),
        videoLink: data['VideoLink'] as String?,
      );

  static VPathExStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? VPathExStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Title': _title,
        'Directions': _directions,
        'MusclesInvolved': _musclesInvolved,
        'RelatedConditions': _relatedConditions,
        'ImageLink': _imageLink,
        'URL': _url,
        'MuscleGroup': _muscleGroup,
        'VideoLink': _videoLink,
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
        'ImageLink': serializeParam(
          _imageLink,
          ParamType.String,
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
      }.withoutNulls;

  static VPathExStruct fromSerializableMap(Map<String, dynamic> data) =>
      VPathExStruct(
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
        imageLink: deserializeParam(
          data['ImageLink'],
          ParamType.String,
          false,
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
      );

  @override
  String toString() => 'VPathExStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VPathExStruct &&
        title == other.title &&
        directions == other.directions &&
        listEquality.equals(musclesInvolved, other.musclesInvolved) &&
        listEquality.equals(relatedConditions, other.relatedConditions) &&
        imageLink == other.imageLink &&
        url == other.url &&
        listEquality.equals(muscleGroup, other.muscleGroup) &&
        videoLink == other.videoLink;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        directions,
        musclesInvolved,
        relatedConditions,
        imageLink,
        url,
        muscleGroup,
        videoLink
      ]);
}

VPathExStruct createVPathExStruct({
  String? title,
  String? directions,
  String? imageLink,
  String? url,
  String? videoLink,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VPathExStruct(
      title: title,
      directions: directions,
      imageLink: imageLink,
      url: url,
      videoLink: videoLink,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VPathExStruct? updateVPathExStruct(
  VPathExStruct? vPathEx, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vPathEx
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVPathExStructData(
  Map<String, dynamic> firestoreData,
  VPathExStruct? vPathEx,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vPathEx == null) {
    return;
  }
  if (vPathEx.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && vPathEx.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vPathExData = getVPathExFirestoreData(vPathEx, forFieldValue);
  final nestedData = vPathExData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = vPathEx.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVPathExFirestoreData(
  VPathExStruct? vPathEx, [
  bool forFieldValue = false,
]) {
  if (vPathEx == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vPathEx.toMap());

  // Add any Firestore field values
  vPathEx.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVPathExListFirestoreData(
  List<VPathExStruct>? vPathExs,
) =>
    vPathExs?.map((e) => getVPathExFirestoreData(e, true)).toList() ?? [];
