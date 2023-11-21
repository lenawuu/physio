import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _ExerciseList = prefs.getStringList('ff_ExerciseList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _ExerciseList;
    });
    _safeInit(() {
      _userRoutine = prefs
              .getStringList('ff_userRoutine')
              ?.map((x) {
                try {
                  return RoutineItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _userRoutine;
    });
    _safeInit(() {
      _HipResults = prefs
              .getStringList('ff_HipResults')
              ?.map((x) {
                try {
                  return IndividualExerciseStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _HipResults;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _ExerciseList = [
    jsonDecode(
        '{"Title":"HIGH BRIDGE HIP MARCH","Directions":"This exercise is used to strengthen the hip flexors in one leg while strengthen the hip extensors in the other leg and can be used as part of a running strength program. Bridge your body up with your hands on an elevated surface like a bench or edge of a sofa. Loop a miniband around both feet and extend both hips to neutral. Raise one knee to 90 degrees hip flexion and hold for up to 5 seconds and alternate sides.","Muscles Involved":["Gluteus Maximus","Hamstrings","Iliopsoas (Hip Flexors)","Core"],"Related Conditions":["Internal Snapping Hip Syndrome","Iliopsoas Tendinopathy","Squat Warm Up","Hip Spine Syndrome","Hip Impingement"],"Video Link":"https://www.youtube.com/embed/Ld3jN0CFwLk?wmode=opaque","Image Link":"https://images.squarespace-cdn.com/content/v1/5f5e8592d2b0854b18af6975/de78522a-e714-4c36-a3f0-91ae83a750e5/QL+Glute+stretch.jpg","URL":"https://www.rehabhero.ca/exercise/high-bridge-hip-march","Muscle group":["Hip"]}'),
    jsonDecode(
        '{"Title":"TACTICAL FROG","Directions":"This is a hip mobility exercise that challenges internal rotation. Start on your elbows and knees on soft flooring or mat. Keep your knees at least shoulder distance apart and keep your spine neutral. Rotate both thighs inwards as far as you can (feet will rotate away from the body) and hold for up to 5 seconds. Doing both legs at the same time prevents movement compensation through hip hiking or side crunching of the torso.","Muscles Involved":["TFL (Tensor Fascia Latae)","Gluteus Minimus","Anterior Fibers of Gluteus Medius"],"Related Conditions":["Snapping Hip Syndrome","Hip Impingement","Glute Amnesia","Non-Specific Low Back Pain","Piriformis Syndrome"],"Video Link":"https://www.youtube.com/embed/QEQa06DBWtQ?wmode=opaque","Image Link":"http://static1.squarespace.com/static/5f5e8592d2b0854b18af6975/5fb7c850d4788b5df8d8af32/6041580253b09545f88b4ea7/1646780041703/Tactical%2BFrog.jpg?format=1500w","URL":"https://www.rehabhero.ca/exercise/tactical-frog","Muscle group":["Hip"]}')
  ];
  List<dynamic> get ExerciseList => _ExerciseList;
  set ExerciseList(List<dynamic> value) {
    _ExerciseList = value;
    prefs.setStringList(
        'ff_ExerciseList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToExerciseList(dynamic value) {
    _ExerciseList.add(value);
    prefs.setStringList(
        'ff_ExerciseList', _ExerciseList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromExerciseList(dynamic value) {
    _ExerciseList.remove(value);
    prefs.setStringList(
        'ff_ExerciseList', _ExerciseList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromExerciseList(int index) {
    _ExerciseList.removeAt(index);
    prefs.setStringList(
        'ff_ExerciseList', _ExerciseList.map((x) => jsonEncode(x)).toList());
  }

  void updateExerciseListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _ExerciseList[index] = updateFn(_ExerciseList[index]);
    prefs.setStringList(
        'ff_ExerciseList', _ExerciseList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInExerciseList(int index, dynamic value) {
    _ExerciseList.insert(index, value);
    prefs.setStringList(
        'ff_ExerciseList', _ExerciseList.map((x) => jsonEncode(x)).toList());
  }

  List<RoutineItemStruct> _userRoutine = [
    RoutineItemStruct.fromSerializableMap(jsonDecode(
        '{"sets":"6","reps":"10","exercise":"{\\"Title\\":\\"jumpin jacks\\",\\"Directions\\":\\"butt\\",\\"MusclesInvolved\\":\\"[\\\\\\"Hello World\\\\\\"]\\",\\"RelatedConditions\\":\\"[\\\\\\"Hello World\\\\\\"]\\",\\"VideoLink\\":\\"Hello World\\",\\"ImageLink\\":\\"Hello World\\",\\"URL\\":\\"Hello World\\",\\"MuscleGroup\\":\\"[\\\\\\"Hello World\\\\\\"]\\"}"}')),
    RoutineItemStruct.fromSerializableMap(jsonDecode(
        '{"sets":"5","reps":"3","exercise":"{\\"Title\\":\\"booty\\",\\"Directions\\":\\"Hello World\\",\\"MusclesInvolved\\":\\"[\\\\\\"Hello World\\\\\\"]\\",\\"RelatedConditions\\":\\"[\\\\\\"Hello World\\\\\\"]\\",\\"VideoLink\\":\\"Hello World\\",\\"ImageLink\\":\\"Hello World\\",\\"URL\\":\\"Hello World\\",\\"MuscleGroup\\":\\"[\\\\\\"Hello World\\\\\\"]\\"}"}'))
  ];
  List<RoutineItemStruct> get userRoutine => _userRoutine;
  set userRoutine(List<RoutineItemStruct> value) {
    _userRoutine = value;
    prefs.setStringList(
        'ff_userRoutine', value.map((x) => x.serialize()).toList());
  }

  void addToUserRoutine(RoutineItemStruct value) {
    _userRoutine.add(value);
    prefs.setStringList(
        'ff_userRoutine', _userRoutine.map((x) => x.serialize()).toList());
  }

  void removeFromUserRoutine(RoutineItemStruct value) {
    _userRoutine.remove(value);
    prefs.setStringList(
        'ff_userRoutine', _userRoutine.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromUserRoutine(int index) {
    _userRoutine.removeAt(index);
    prefs.setStringList(
        'ff_userRoutine', _userRoutine.map((x) => x.serialize()).toList());
  }

  void updateUserRoutineAtIndex(
    int index,
    RoutineItemStruct Function(RoutineItemStruct) updateFn,
  ) {
    _userRoutine[index] = updateFn(_userRoutine[index]);
    prefs.setStringList(
        'ff_userRoutine', _userRoutine.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInUserRoutine(int index, RoutineItemStruct value) {
    _userRoutine.insert(index, value);
    prefs.setStringList(
        'ff_userRoutine', _userRoutine.map((x) => x.serialize()).toList());
  }

  RoutineItemStruct _routineEx1 = RoutineItemStruct.fromSerializableMap(jsonDecode(
      '{"sets":"3","reps":"8","exercise":"{\\"Title\\":\\"Eccentric Reverse Fly\\",\\"Directions\\":\\"This exercise uses a band to strengthen the scapular retractors and shoulder horizontal extensors. Hold a band with your palms facing up and raise them to just below shoulder height. Pull the band apart until the middle of the band touches your chest and slowly return back to starting position at a 5-7 second tempo.\\",\\"MusclesInvolved\\":\\"[\\\\\\"Middle Trapezius\\\\\\",\\\\\\"Rhomboids\\\\\\",\\\\\\"Rotator Cuff\\\\\\",\\\\\\"Posterior Deltoids\\\\\\"]\\",\\"RelatedConditions\\":\\"[\\\\\\"Rhomboid Strain\\\\\\",\\\\\\"Upper Cross Syndrome\\\\\\",\\\\\\"Rotator Cuff Tear\\\\\\"]\\",\\"videoURL\\":\\"https://www.youtube.com/embed/74wyKVYgETU?wmode=opaque\\",\\"imageURL\\":\\"http://static1.squarespace.com/static/5f5e8592d2b0854b18af6975/5fb7c850d4788b5df8d8af32/600c7f6cc9ce5d2dab6275d7/1687709506635/Eccentric%2BReverse%2BFly.jpg?format=1500w\\",\\"URL\\":\\"https://www.rehabhero.ca/exercise/eccentric-reverse-fly\\",\\"MuscleGroup\\":\\"[\\\\\\"Back\\\\\\",\\\\\\"Shoulder\\\\\\"]\\"}"}'));
  RoutineItemStruct get routineEx1 => _routineEx1;
  set routineEx1(RoutineItemStruct value) {
    _routineEx1 = value;
  }

  void updateRoutineEx1Struct(Function(RoutineItemStruct) updateFn) {
    updateFn(_routineEx1);
  }

  RoutineItemStruct _routineEx2 = RoutineItemStruct.fromSerializableMap(jsonDecode(
      '{"sets":"3","reps":"10","exercise":"{\\"Title\\":\\"Internal Rotation Hip Lift\\",\\"Directions\\":\\"This is an internal hip rotation mobility and stability exercise. Start by lying down on your back with a yoga block or foam roller between your knees and heels planted on a bench. Squeeze the yoga block and raise the pelvis one inch off the ground. Hold the raised position for up to 5 seconds. Come back down to a rested position to complete the first repetition. Then rotate one leg out by 5-10 degrees and complete another hip lift. Repeat until 45 degrees of hip rotation is achieved or until the maximum range you can tolerate is achieved for the day.\\",\\"MusclesInvolved\\":\\"[\\\\\\"Glutes\\\\\\",\\\\\\"Gluteus Maximus (Hip Extension)\\\\\\",\\\\\\"Gluteus Medius Anterior Fibers (Hip Internal Rotation)\\\\\\",\\\\\\"Gluteus Minimus (Hip Internal Rotation)\\\\\\",\\\\\\"Hamstrings\\\\\\",\\\\\\"Tensor Fascia Latae (TFL)\\\\\\",\\\\\\"Adductors\\\\\\",\\\\\\"Adductor Longus\\\\\\",\\\\\\"Adductor Magnus\\\\\\",\\\\\\"Adductor Brevis\\\\\\",\\\\\\"Pectineus\\\\\\"]\\",\\"RelatedConditions\\":\\"[\\\\\\"Hip Impingement\\\\\\",\\\\\\"Internal Snapping Hip Syndrome\\\\\\",\\\\\\"External Snapping Hip Syndrome\\\\\\",\\\\\\"Hip Spine Syndrome\\\\\\",\\\\\\"Mechanical Low Back Pain\\\\\\",\\\\\\"Lower Kinetic Pain Syndrome\\\\\\",\\\\\\"Hip Bursitis\\\\\\",\\\\\\"ITB Syndrome\\\\\\",\\\\\\"Sacroiliac Joint Syndrome\\\\\\"]\\",\\"VideoLink\\":\\"https://www.youtube.com/embed/YylAVqnt2Mw?wmode=opaque\\",\\"ImageLink\\":\\"https://static1.squarespace.com/static/5f5e8592d2b0854b18af6975/5fb7c850d4788b5df8d8af32/61ccb01a57336a5a31ba0526/1687362339845/Internal%2BRotation%2BHip%2BLift.jpg?format=1500w\\",\\"URL\\":\\"https://www.rehabhero.ca/exercise/internal-rotation-hip-lift\\",\\"MuscleGroup\\":\\"[\\\\\\"Hip\\\\\\"]\\"}"}'));
  RoutineItemStruct get routineEx2 => _routineEx2;
  set routineEx2(RoutineItemStruct value) {
    _routineEx2 = value;
  }

  void updateRoutineEx2Struct(Function(RoutineItemStruct) updateFn) {
    updateFn(_routineEx2);
  }

  RoutineItemStruct _routineEx3 = RoutineItemStruct.fromSerializableMap(jsonDecode(
      '{"sets":"3","reps":"15","exercise":"{\\"Title\\":\\"Kneeling Half Moon Pose\\",\\"Directions\\":\\"The kneeling half moon pose is a yoga inspired exercise that is a regressed version of the convention HIP AIRPLANE exercise. Do this closed chain hip abduction exercise to engage your hip muscles and to improve hip stability. Start on your hands and knees and slowly lift up one side arm and leg up while rotating upwards with the torso. Extend the raised leg out through the heel and reach towards the ceiling with your arm. Keep the spine neutral by keeping the shoulders squared with your hips.\\",\\"MusclesInvolved\\":\\"[\\\\\\"Glutes\\\\\\",\\\\\\"Gluteus Medius\\\\\\",\\\\\\"Gluteus Minimus\\\\\\",\\\\\\"Piriformis\\\\\\",\\\\\\"Core\\\\\\",\\\\\\"External Oblique\\\\\\",\\\\\\"Internal Oblique\\\\\\",\\\\\\"Transversus Abdominis\\\\\\",\\\\\\"Quadratus Lumborum\\\\\\"]\\",\\"RelatedConditions\\":\\"[\\\\\\"Glute Amnesia\\\\\\",\\\\\\"Sacroiliac Joint Syndrome\\\\\\",\\\\\\"Low Back Pain\\\\\\",\\\\\\"Hip Bursitis\\\\\\",\\\\\\"Greater Trochanteric Pain Syndrome\\\\\\",\\\\\\"Gluteus Maximus Tendinitis\\\\\\",\\\\\\"Gluteus Medius Tendinitis\\\\\\"]\\",\\"VideoLink\\":\\"https://www.youtube.com/embed/rNPIXyPJC58?feature=oembed\\",\\"ImageLink\\":\\"https://images.squarespace-cdn.com/content/v1/5f5e8592d2b0854b18af6975/4ab7c748-4dfd-4263-9c04-623a57daebd2/Foam+Roller+Single+Leg+Bridge.jpg\\",\\"URL\\":\\"https://www.rehabhero.ca/exercise/kneeling-half-moon-pose\\",\\"MuscleGroup\\":\\"[\\\\\\"Back\\\\\\",\\\\\\"Hip\\\\\\"]\\"}"}'));
  RoutineItemStruct get routineEx3 => _routineEx3;
  set routineEx3(RoutineItemStruct value) {
    _routineEx3 = value;
  }

  void updateRoutineEx3Struct(Function(RoutineItemStruct) updateFn) {
    updateFn(_routineEx3);
  }

  RoutineItemStruct _routineEx4 = RoutineItemStruct.fromSerializableMap(jsonDecode(
      '{"sets":"2","reps":"10","exercise":"{\\"Title\\":\\"Half Knee Archer\\",\\"Directions\\":\\"The half knee archer is a thoracic rotation and shoulder circumduction mobility exercise. Start by kneeling down with one leg and raise both arms out in front of your. Keep one arm stationary forwards and reach directly back with one arm behind you while rotating through the torso. Raise the back arm overhead then forwards while returning back to the starting position.\\",\\"MusclesInvolved\\":\\"[\\\\\\"Thoracic Spine\\\\\\",\\\\\\"Scapulothoracic Joint\\\\\\",\\\\\\"Glenohumeral Joint\\\\\\",\\\\\\"Serratus Posterior Superior\\\\\\",\\\\\\"Rhomboids\\\\\\",\\\\\\"Trapezius\\\\\\",\\\\\\"Multifidus\\\\\\"]\\",\\"RelatedConditions\\":\\"[\\\\\\"Costovertebral Irritation / Costotransverse Irritation\\\\\\",\\\\\\"Dowager’s Hump\\\\\\",\\\\\\"Thoracolumbar Syndrome\\\\\\",\\\\\\"Cervicothoracic Joint Dysfunction / CT Junction Dysfunction\\\\\\",\\\\\\"Shoulder Impingement\\\\\\",\\\\\\"Rotator Cuff Tendinitis\\\\\\",\\\\\\"Text Neck\\\\\\",\\\\\\"Neck Associated Disorder\\\\\\"]\\",\\"VideoLink\\":\\"https://www.youtube.com/watch?v=Xtdvnm9AIXY&t=8s&ab_channel=RehabHero\\",\\"ImageLink\\":\\"https://static1.squarespace.com/static/5f5e8592d2b0854b18af6975/5fb7c850d4788b5df8d8af32/646e2acdd3c29100701daaaf/?format=1000w\\",\\"URL\\":\\"https://www.rehabhero.ca/exercise/half-kneel-archer?rq=archer\\",\\"MuscleGroup\\":\\"[\\\\\\"Back\\\\\\",\\\\\\"Shoulder\\\\\\"]\\"}"}'));
  RoutineItemStruct get routineEx4 => _routineEx4;
  set routineEx4(RoutineItemStruct value) {
    _routineEx4 = value;
  }

  void updateRoutineEx4Struct(Function(RoutineItemStruct) updateFn) {
    updateFn(_routineEx4);
  }

  dynamic _exercis397 = jsonDecode(
      '{"Title":"POSTERIOR GLIDE ROTATIONS","Directions":"The posterior glide rotations exercise utilizes a light monster band to assist in shoulder centration. Start by looping one end of the band around the front of the shoulder making sure that the band is contacting the humeral aspect of the shoulder joint. Anchor the other end of the band to a stable object behind you. Take a step forward to add tension into the band and raise your arm to 90 degrees shoulder abduction. Begin to rotate the shoulder into end range external rotation and internal rotation while remaining in an abducted position. Complete 15-20 pain free repetitions per set.","Muscles Involved":["glenohumeral joint","glenohumeral joint capsule","rotator cuff","supraspinatus","teres minor","infraspinatus","subscapularis"],"Related Conditions":["dynamic shoulder instability","shoulder impingement","rotator cuff tendinitis","frozen shoulder","adhesive capsulitis"],"Video Link":"https:https://www.youtube.com/embed/GTylENDw3Sc?feature=oembed","Image Link":"http://static1.squarespace.com/static/5f5e8592d2b0854b18af6975/5fb7c850d4788b5df8d8af32/651d96d4618c3b3fb434bd12/1696687251013/posterior+glide+rotations.jpg?format=1500w","URL":"https://www.rehabhero.ca/exercise/posterior-glide-rotations","Muscle group":["Shoulder"]}');
  dynamic get exercis397 => _exercis397;
  set exercis397(dynamic value) {
    _exercis397 = value;
  }

  List<IndividualExerciseStruct> _HipResults = [
    IndividualExerciseStruct.fromSerializableMap(jsonDecode(
        '{"Title":"Internal Rotation Hip Lift","Directions":"This is an internal hip rotation mobility and stability exercise. Start by lying down on your back with a yoga block or foam roller between your knees and heels planted on a bench. Squeeze the yoga block and raise the pelvis one inch off the ground. Hold the raised position for up to 5 seconds. Come back down to a rested position to complete the first repetition. Then rotate one leg out by 5-10 degrees and complete another hip lift. Repeat until 45 degrees of hip rotation is achieved or until the maximum range you can tolerate is achieved for the day.","MusclesInvolved":"[\\"Hello World\\"]","RelatedConditions":"[\\"Hello World\\"]","videoURL":"https://www.youtube.com/embed/YylAVqnt2Mw?wmode=opaque","imageURL":"https://static1.squarespace.com/static/5f5e8592d2b0854b18af6975/5fb7c850d4788b5df8d8af32/61ccb01a57336a5a31ba0526/1687362339845/Internal%2BRotation%2BHip%2BLift.jpg?format=1500w","URL":"https://www.rehabhero.ca/exercise/internal-rotation-hip-lift","MuscleGroup":"[\\"Hello World\\"]"}')),
    IndividualExerciseStruct.fromSerializableMap(jsonDecode(
        '{"Title":"Kneeling Half Moon Pose","Directions":"The kneeling half moon pose is a yoga inspired exercise that is a regressed version of the convention HIP AIRPLANE exercise. Do this closed chain hip abduction exercise to engage your hip muscles and to improve hip stability. Start on your hands and knees and slowly lift up one side arm and leg up while rotating upwards with the torso. Extend the raised leg out through the heel and reach towards the ceiling with your arm. Keep the spine neutral by keeping the shoulders squared with your hips.","MusclesInvolved":"[\\"Hello World\\"]","RelatedConditions":"[\\"Hello World\\"]","videoURL":"https://www.youtube.com/embed/rNPIXyPJC58?feature=oembed","imageURL":"https://images.squarespace-cdn.com/content/v1/5f5e8592d2b0854b18af6975/4ab7c748-4dfd-4263-9c04-623a57daebd2/Foam+Roller+Single+Leg+Bridge.jpg","URL":"https://www.rehabhero.ca/exercise/kneeling-half-moon-pose","MuscleGroup":"[\\"Hello World\\"]"}'))
  ];
  List<IndividualExerciseStruct> get HipResults => _HipResults;
  set HipResults(List<IndividualExerciseStruct> value) {
    _HipResults = value;
    prefs.setStringList(
        'ff_HipResults', value.map((x) => x.serialize()).toList());
  }

  void addToHipResults(IndividualExerciseStruct value) {
    _HipResults.add(value);
    prefs.setStringList(
        'ff_HipResults', _HipResults.map((x) => x.serialize()).toList());
  }

  void removeFromHipResults(IndividualExerciseStruct value) {
    _HipResults.remove(value);
    prefs.setStringList(
        'ff_HipResults', _HipResults.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromHipResults(int index) {
    _HipResults.removeAt(index);
    prefs.setStringList(
        'ff_HipResults', _HipResults.map((x) => x.serialize()).toList());
  }

  void updateHipResultsAtIndex(
    int index,
    IndividualExerciseStruct Function(IndividualExerciseStruct) updateFn,
  ) {
    _HipResults[index] = updateFn(_HipResults[index]);
    prefs.setStringList(
        'ff_HipResults', _HipResults.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInHipResults(int index, IndividualExerciseStruct value) {
    _HipResults.insert(index, value);
    prefs.setStringList(
        'ff_HipResults', _HipResults.map((x) => x.serialize()).toList());
  }

  List<IndividualExerciseStruct> _ShoulderResults = [
    IndividualExerciseStruct.fromSerializableMap(jsonDecode(
        '{"Title":"Eccentric Reverse Fly","Directions":"This exercise uses a band to strengthen the scapular retractors and shoulder horizontal extensors. Hold a band with your palms facing up and raise them to just below shoulder height. Pull the band apart until the middle of the band touches your chest and slowly return back to starting position at a 5-7 second tempo.","MusclesInvolved":"[\\"Hello World\\"]","RelatedConditions":"[\\"Hello World\\"]","videoURL":"https://www.youtube.com/embed/74wyKVYgETU?wmode=opaque","imageURL":"http://static1.squarespace.com/static/5f5e8592d2b0854b18af6975/5fb7c850d4788b5df8d8af32/600c7f6cc9ce5d2dab6275d7/1687709506635/Eccentric%2BReverse%2BFly.jpg?format=1500w","URL":"https://www.rehabhero.ca/exercise/eccentric-reverse-fly","MuscleGroup":"[\\"Hello World\\"]"}')),
    IndividualExerciseStruct.fromSerializableMap(jsonDecode(
        '{"Title":"Half Kneel Archer","Directions":"The half knee archer is a thoracic rotation and shoulder circumduction mobility exercise. Start by kneeling down with one leg and raise both arms out in front of your. Keep one arm stationary forwards and reach directly back with one arm behind you while rotating through the torso. Raise the back arm overhead then forwards while returning back to the starting position.","MusclesInvolved":"[\\"Hello World\\"]","RelatedConditions":"[\\"Hello World\\"]","videoURL":"https://www.youtube.com/watch?v=Xtdvnm9AIXY&t=8s&ab_channel=RehabHero","imageURL":"https://static1.squarespace.com/static/5f5e8592d2b0854b18af6975/5fb7c850d4788b5df8d8af32/646e2acdd3c29100701daaaf/?format=1000w","URL":"https://www.rehabhero.ca/exercise/half-kneel-archer?rq=archer","MuscleGroup":"[\\"Hello World\\"]"}'))
  ];
  List<IndividualExerciseStruct> get ShoulderResults => _ShoulderResults;
  set ShoulderResults(List<IndividualExerciseStruct> value) {
    _ShoulderResults = value;
  }

  void addToShoulderResults(IndividualExerciseStruct value) {
    _ShoulderResults.add(value);
  }

  void removeFromShoulderResults(IndividualExerciseStruct value) {
    _ShoulderResults.remove(value);
  }

  void removeAtIndexFromShoulderResults(int index) {
    _ShoulderResults.removeAt(index);
  }

  void updateShoulderResultsAtIndex(
    int index,
    IndividualExerciseStruct Function(IndividualExerciseStruct) updateFn,
  ) {
    _ShoulderResults[index] = updateFn(_ShoulderResults[index]);
  }

  void insertAtIndexInShoulderResults(
      int index, IndividualExerciseStruct value) {
    _ShoulderResults.insert(index, value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
