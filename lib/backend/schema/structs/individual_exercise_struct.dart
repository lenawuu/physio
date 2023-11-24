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
    String? url,
    List<String>? muscleGroup,
    String? videoLink,
    String? imageLink,
  })  : _title = title,
        _directions = directions,
        _musclesInvolved = musclesInvolved,
        _relatedConditions = relatedConditions,
        _url = url,
        _muscleGroup = muscleGroup,
        _videoLink = videoLink,
        _imageLink = imageLink;

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
        imageLink == other.imageLink;
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
        imageLink
      ]);
}

IndividualExerciseStruct createIndividualExerciseStruct({
  String? title,
  String? directions,
  String? url,
  String? videoLink,
  String? imageLink,
}) =>
    IndividualExerciseStruct(
      title: title,
      directions: directions,
      url: url,
      videoLink: videoLink,
      imageLink: imageLink,
    );
