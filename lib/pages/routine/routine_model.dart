import '/flutter_flow/flutter_flow_util.dart';
import 'routine_widget.dart' show RoutineWidget;
import 'package:flutter/material.dart';

class RoutineModel extends FlutterFlowModel<RoutineWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
