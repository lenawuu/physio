import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class HipExercisesRecord extends FirestoreRecord {
  HipExercisesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "MuscleGroup" field.
  List<String>? _muscleGroup;
  List<String> get muscleGroup => _muscleGroup ?? const [];
  bool hasMuscleGroup() => _muscleGroup != null;

  // "MusclesInvolved" field.
  List<String>? _musclesInvolved;
  List<String> get musclesInvolved => _musclesInvolved ?? const [];
  bool hasMusclesInvolved() => _musclesInvolved != null;

  // "RelatedConditions" field.
  List<String>? _relatedConditions;
  List<String> get relatedConditions => _relatedConditions ?? const [];
  bool hasRelatedConditions() => _relatedConditions != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "URL" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "ImageLink" field.
  String? _imageLink;
  String get imageLink => _imageLink ?? '';
  bool hasImageLink() => _imageLink != null;

  // "VideoLink" field.
  String? _videoLink;
  String get videoLink => _videoLink ?? '';
  bool hasVideoLink() => _videoLink != null;

  // "Directions" field.
  String? _directions;
  String get directions => _directions ?? '';
  bool hasDirections() => _directions != null;

  void _initializeFields() {
    _muscleGroup = getDataList(snapshotData['MuscleGroup']);
    _musclesInvolved = getDataList(snapshotData['MusclesInvolved']);
    _relatedConditions = getDataList(snapshotData['RelatedConditions']);
    _title = snapshotData['Title'] as String?;
    _url = snapshotData['URL'] as String?;
    _imageLink = snapshotData['ImageLink'] as String?;
    _videoLink = snapshotData['VideoLink'] as String?;
    _directions = snapshotData['Directions'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hipExercises');

  static Stream<HipExercisesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HipExercisesRecord.fromSnapshot(s));

  static Future<HipExercisesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HipExercisesRecord.fromSnapshot(s));

  static HipExercisesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HipExercisesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HipExercisesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HipExercisesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HipExercisesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HipExercisesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHipExercisesRecordData({
  String? title,
  String? url,
  String? imageLink,
  String? videoLink,
  String? directions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'URL': url,
      'ImageLink': imageLink,
      'VideoLink': videoLink,
      'Directions': directions,
    }.withoutNulls,
  );

  return firestoreData;
}

class HipExercisesRecordDocumentEquality
    implements Equality<HipExercisesRecord> {
  const HipExercisesRecordDocumentEquality();

  @override
  bool equals(HipExercisesRecord? e1, HipExercisesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.muscleGroup, e2?.muscleGroup) &&
        listEquality.equals(e1?.musclesInvolved, e2?.musclesInvolved) &&
        listEquality.equals(e1?.relatedConditions, e2?.relatedConditions) &&
        e1?.title == e2?.title &&
        e1?.url == e2?.url &&
        e1?.imageLink == e2?.imageLink &&
        e1?.videoLink == e2?.videoLink &&
        e1?.directions == e2?.directions;
  }

  @override
  int hash(HipExercisesRecord? e) => const ListEquality().hash([
        e?.muscleGroup,
        e?.musclesInvolved,
        e?.relatedConditions,
        e?.title,
        e?.url,
        e?.imageLink,
        e?.videoLink,
        e?.directions
      ]);

  @override
  bool isValidKey(Object? o) => o is HipExercisesRecord;
}
