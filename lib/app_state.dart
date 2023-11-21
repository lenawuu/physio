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
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _HipResults = [
    jsonDecode(
        '{"Title":"Internal Hip Rotation Lift","Directions":"This is an internal hip rotation mobility and stability exercise. Start by lying down on your back with a yoga block or foam roller between your knees and heels planted on a bench. Squeeze the yoga block and raise the pelvis one inch off the ground. Hold the raised position for up to 5 seconds. Come back down to a rested position to complete the first repetition. Then rotate one leg out by 5-10 degrees and complete another hip lift. Repeat until 45 degrees of hip rotation is achieved or until the maximum range you can tolerate is achieved for the day.","MusclesInvolved":["Glutes","Gluteus Maximus (Hip Extension)","Gluteus Medius Anterior Fibers (Hip Internal Rotation)","Gluteus Minimus (Hip Internal Rotation)","Hamstrings","Tensor Fascia Latae (TFL)","Adductors","Adductor Longus","Adductor Magnus","Adductor Brevis","Pectineus"],"RelatedConditions":["Hip Impingement","Internal Snapping Hip Syndrome","External Snapping Hip Syndrome","Groin Strain","Hip Spine Syndrome","Mechanical Low Back Pain","Lower Kinetic Pain Syndrome","Hip Bursitis","ITB Syndrome","Sacroiliac Joint Syndrome"],"VideoLink":"https://www.youtube.com/embed/YylAVqnt2Mw?wmode=opaque","ImageLink":"http://static1.squarespace.com/static/5f5e8592d2b0854b18af6975/5fb7c850d4788b5df8d8af32/61ccb01a57336a5a31ba0526/1687362339845/Internal%2BRotation%2BHip%2BLift.jpg?format=1500w","URL":"https://www.rehabhero.ca/exercise/internal-rotation-hip-lift","MuscleGroup":["Hip"]}'),
    jsonDecode(
        '{"Title":"Kneeling Half Moon Pose","Directions":"The kneeling half moon pose is a yoga inspired exercise that is a regressed version of the convention HIP AIRPLANE exercise. Do this closed chain hip abduction exercise to engage your hip muscles and to improve hip stability. Start on your hands and knees and slowly lift up one side’s arm and leg up while rotating upwards with the torso. Extend the raised leg out through the heel and reach towards the ceiling with your arm. Keep the spine neutral by keeping the shoulders squared with your hips.","MusclesInvolved":["Glutes","gluteus medius","gluteus maximus","piriformis","Core","external oblique","internal oblique","transversus abdominis","quadratus lumborum"],"Related Conditions":["Glute Amnesia","Sacroiliac Joint Syndrome","Low Back Pain","Hip Spine Syndrome","hip bursitis","greater trochanteric pain syndrome","gluteus maximus tendinitis","gluteus medius tendinitis"],"VideoLink":"https:https://www.youtube.com/embed/rNPIXyPJC58?feature=oembed","ImageLink":"https://images.squarespace-cdn.com/content/v1/5f5e8592d2b0854b18af6975/4ab7c748-4dfd-4263-9c04-623a57daebd2/Foam+Roller+Single+Leg+Bridge.jpg","URL":"https://www.rehabhero.ca/exercise/kneeling-half-moon-pose","MuscleGroup":["Hip"]}')
  ];
  List<dynamic> get HipResults => _HipResults;
  set HipResults(List<dynamic> value) {
    _HipResults = value;
  }

  void addToHipResults(dynamic value) {
    _HipResults.add(value);
  }

  void removeFromHipResults(dynamic value) {
    _HipResults.remove(value);
  }

  void removeAtIndexFromHipResults(int index) {
    _HipResults.removeAt(index);
  }

  void updateHipResultsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _HipResults[index] = updateFn(_HipResults[index]);
  }

  void insertAtIndexInHipResults(int index, dynamic value) {
    _HipResults.insert(index, value);
  }

  List<RoutineItemStruct> _userRoutine = [];
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
