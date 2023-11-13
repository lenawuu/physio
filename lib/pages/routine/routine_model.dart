import '/components/routine_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'routine_widget.dart' show RoutineWidget;
import 'package:flutter/material.dart';

class RoutineModel extends FlutterFlowModel<RoutineWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for RoutineItem component.
  late RoutineItemModel routineItemModel1;
  // Model for RoutineItem component.
  late RoutineItemModel routineItemModel2;
  // Model for RoutineItem component.
  late RoutineItemModel routineItemModel3;
  // Model for RoutineItem component.
  late RoutineItemModel routineItemModel4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    routineItemModel1 = createModel(context, () => RoutineItemModel());
    routineItemModel2 = createModel(context, () => RoutineItemModel());
    routineItemModel3 = createModel(context, () => RoutineItemModel());
    routineItemModel4 = createModel(context, () => RoutineItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    routineItemModel1.dispose();
    routineItemModel2.dispose();
    routineItemModel3.dispose();
    routineItemModel4.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
