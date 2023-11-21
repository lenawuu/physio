import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'muscle_category_button_model.dart';
export 'muscle_category_button_model.dart';

class MuscleCategoryButtonWidget extends StatefulWidget {
  const MuscleCategoryButtonWidget({super.key});

  @override
  _MuscleCategoryButtonWidgetState createState() =>
      _MuscleCategoryButtonWidgetState();
}

class _MuscleCategoryButtonWidgetState
    extends State<MuscleCategoryButtonWidget> {
  late MuscleCategoryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MuscleCategoryButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: 'Ankle',
      options: FFButtonOptions(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'SF Pro',
              color: Colors.white,
              useGoogleFonts: false,
            ),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
