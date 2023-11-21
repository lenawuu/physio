// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IndividualExerciseStruct extends BaseStruct {
  IndividualExerciseStruct({
    String? title,
    String? directions,
    List<String>? musclesInvolved,
    List<String>? relatedConditions,
    String? videoURL,
    String? imageURL,
    String? url,
    List<String>? muscleGroup,
  })  : _title = title,
        _directions = directions,
        _musclesInvolved = musclesInvolved,
        _relatedConditions = relatedConditions,
        _videoURL = videoURL,
        _imageURL = imageURL,
        _url = url,
        _muscleGroup = muscleGroup;

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

  // "videoURL" field.
  String? _videoURL;
  String get videoURL => _videoURL ?? '';
  set videoURL(String? val) => _videoURL = val;
  bool hasVideoURL() => _videoURL != null;

  // "imageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  set imageURL(String? val) => _imageURL = val;
  bool hasImageURL() => _imageURL != null;

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

  static IndividualExerciseStruct fromMap(Map<String, dynamic> data) =>
      IndividualExerciseStruct(
        title: data['Title'] as String?,
        directions: data['Directions'] as String?,
        musclesInvolved: getDataList(data['MusclesInvolved']),
        relatedConditions: getDataList(data['RelatedConditions']),
        videoURL: data['videoURL'] as String?,
        imageURL: data['imageURL'] as String?,
        url: data['URL'] as String?,
        muscleGroup: getDataList(data['MuscleGroup']),
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
        'videoURL': _videoURL,
        'imageURL': _imageURL,
        'URL': _url,
        'MuscleGroup': _muscleGroup,
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
        'videoURL': serializeParam(
          _videoURL,
          ParamType.String,
        ),
        'imageURL': serializeParam(
          _imageURL,
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
        videoURL: deserializeParam(
          data['videoURL'],
          ParamType.String,
          false,
        ),
        imageURL: deserializeParam(
          data['imageURL'],
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
        videoURL == other.videoURL &&
        imageURL == other.imageURL &&
        url == other.url &&
        listEquality.equals(muscleGroup, other.muscleGroup);
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        directions,
        musclesInvolved,
        relatedConditions,
        videoURL,
        imageURL,
        url,
        muscleGroup
      ]);
}

IndividualExerciseStruct createIndividualExerciseStruct({
  String? title,
  String? directions,
  String? videoURL,
  String? imageURL,
  String? url,
}) =>
    IndividualExerciseStruct(
      title: title,
      directions: directions,
      videoURL: videoURL,
      imageURL: imageURL,
      url: url,
    );
