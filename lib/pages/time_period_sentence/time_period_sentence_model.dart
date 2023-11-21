import '/flutter_flow/flutter_flow_util.dart';
import 'time_period_sentence_widget.dart' show TimePeriodSentenceWidget;
import 'package:flutter/material.dart';

class TimePeriodSentenceModel
    extends FlutterFlowModel<TimePeriodSentenceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Sets widget.
  FocusNode? setsFocusNode;
  TextEditingController? setsController;
  String? Function(BuildContext, String?)? setsControllerValidator;
  // State field(s) for Reps widget.
  FocusNode? repsFocusNode;
  TextEditingController? repsController;
  String? Function(BuildContext, String?)? repsControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    setsFocusNode?.dispose();
    setsController?.dispose();

    repsFocusNode?.dispose();
    repsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
