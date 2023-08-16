import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_list_model.dart';
export 'navbar_list_model.dart';

class NavbarListWidget extends StatefulWidget {
  const NavbarListWidget({Key? key}) : super(key: key);

  @override
  _NavbarListWidgetState createState() => _NavbarListWidgetState();
}

class _NavbarListWidgetState extends State<NavbarListWidget> {
  late NavbarListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FFButtonWidget(
          onPressed: () async {
            context.pushNamed('VisitList');
          },
          text: FFLocalizations.of(context).getText(
            'vim5bils' /* Liste des visites */,
          ),
          options: FFButtonOptions(
            width: 412.0,
            height: 40.0,
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).alternate,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primary,
                ),
            elevation: 3.0,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
        FFButtonWidget(
          onPressed: () async {
            context.pushNamed('PointList');
          },
          text: FFLocalizations.of(context).getText(
            'kxjj51wx' /* Points d'intérêts */,
          ),
          options: FFButtonOptions(
            width: 436.0,
            height: 40.0,
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).alternate,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primary,
                ),
            elevation: 3.0,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
      ],
    );
  }
}
