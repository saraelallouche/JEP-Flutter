import '/backend/api_requests/api_calls.dart';
import '/components/navbar_bottom_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'point_detail_visit_model.dart';
export 'point_detail_visit_model.dart';

class PointDetailVisitWidget extends StatefulWidget {
  const PointDetailVisitWidget({
    Key? key,
    required this.idVisite,
    required this.idItinerary,
    required this.idPoint,
  }) : super(key: key);

  final int? idVisite;
  final int? idItinerary;
  final int? idPoint;

  @override
  _PointDetailVisitWidgetState createState() => _PointDetailVisitWidgetState();
}

class _PointDetailVisitWidgetState extends State<PointDetailVisitWidget> {
  late PointDetailVisitModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PointDetailVisitModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: PointVisiteAPICall.call(
        idVisite: widget.idVisite,
        idItinerary: widget.idItinerary,
        idPoint: widget.idPoint,
        langue: FFLocalizations.of(context).getVariableText(
          frText: '',
          esText: 'es/',
          enText: 'en/',
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final pointDetailVisitPointVisiteAPIResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 90.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 20.0, 15.0, 10.0),
                              child: Text(
                                getJsonField(
                                  pointDetailVisitPointVisiteAPIResponse
                                      .jsonBody,
                                  r'''$.the_point.name''',
                                ).toString(),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.sizeOf(context).width * 0.8,
                                maxHeight:
                                    MediaQuery.sizeOf(context).height * 0.55,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  getJsonField(
                                    pointDetailVisitPointVisiteAPIResponse
                                        .jsonBody,
                                    r'''$.the_point.image.image_detail''',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 0.0),
                              child: FlutterFlowAudioPlayer(
                                audio: Audio.network(
                                  getJsonField(
                                    pointDetailVisitPointVisiteAPIResponse
                                        .jsonBody,
                                    r'''$.the_point.audio_desc''',
                                  ),
                                  metas: Metas(
                                    id: '10045Sphinx__de_Tanis_fr.mp3-2e0bf6ea',
                                  ),
                                ),
                                titleTextStyle:
                                    FlutterFlowTheme.of(context).titleSmall,
                                playbackDurationTextStyle:
                                    FlutterFlowTheme.of(context).labelSmall,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                playbackButtonColor:
                                    FlutterFlowTheme.of(context).primary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).alternate,
                                elevation: 4.0,
                                playInBackground: PlayInBackground
                                    .disabledRestoreOnForeground,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 10.0, 15.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    pointDetailVisitPointVisiteAPIResponse
                                        .jsonBody,
                                    r'''$.the_point.description''',
                                  ).toString(),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF585B63),
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'bdddyyb2' /* ©  */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    getJsonField(
                                      pointDetailVisitPointVisiteAPIResponse
                                          .jsonBody,
                                      r'''$.the_point.ref_desc''',
                                    ).toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 15.0, 10.0),
                              child: Text(
                                getJsonField(
                                  pointDetailVisitPointVisiteAPIResponse
                                      .jsonBody,
                                  r'''$.the_point.tips''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (getJsonField(
                                                  pointDetailVisitPointVisiteAPIResponse
                                                      .jsonBody,
                                                  r'''$.prev_itin''',
                                                ) ==
                                                null) {
                                              context.pushNamed(
                                                'VisitDetail',
                                                queryParameters: {
                                                  'id': serializeParam(
                                                    widget.idVisite,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              if (getJsonField(
                                                    pointDetailVisitPointVisiteAPIResponse
                                                        .jsonBody,
                                                    r'''$.prev_step''',
                                                  ) !=
                                                  null) {
                                                context.pushNamed(
                                                  'Step',
                                                  queryParameters: {
                                                    'idVisite': serializeParam(
                                                      widget.idVisite,
                                                      ParamType.int,
                                                    ),
                                                    'idItinerary':
                                                        serializeParam(
                                                      getJsonField(
                                                        pointDetailVisitPointVisiteAPIResponse
                                                            .jsonBody,
                                                        r'''$.prev_itin.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                    'idStep': serializeParam(
                                                      getJsonField(
                                                        pointDetailVisitPointVisiteAPIResponse
                                                            .jsonBody,
                                                        r'''$.prev_step''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  'PointDetailVisit',
                                                  queryParameters: {
                                                    'idVisite': serializeParam(
                                                      widget.idVisite,
                                                      ParamType.int,
                                                    ),
                                                    'idItinerary':
                                                        serializeParam(
                                                      getJsonField(
                                                        pointDetailVisitPointVisiteAPIResponse
                                                            .jsonBody,
                                                        r'''$.prev_itin.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                    'idPoint': serializeParam(
                                                      getJsonField(
                                                        pointDetailVisitPointVisiteAPIResponse
                                                            .jsonBody,
                                                        r'''$.prev_itin.point_interest.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            }
                                          },
                                          text: '',
                                          icon: FaIcon(
                                            FontAwesomeIcons.longArrowAltLeft,
                                          ),
                                          options: FFButtonOptions(
                                            width: 190.0,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (getJsonField(
                                                  pointDetailVisitPointVisiteAPIResponse
                                                      .jsonBody,
                                                  r'''$.next_itin''',
                                                ) ==
                                                null) {
                                              context.pushNamed('VisitList');
                                            } else {
                                              if (getJsonField(
                                                    pointDetailVisitPointVisiteAPIResponse
                                                        .jsonBody,
                                                    r'''$.first_step''',
                                                  ) ==
                                                  false) {
                                                context.pushNamed(
                                                  'PointDetailVisit',
                                                  queryParameters: {
                                                    'idVisite': serializeParam(
                                                      widget.idVisite,
                                                      ParamType.int,
                                                    ),
                                                    'idItinerary':
                                                        serializeParam(
                                                      getJsonField(
                                                        pointDetailVisitPointVisiteAPIResponse
                                                            .jsonBody,
                                                        r'''$.next_itin.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                    'idPoint': serializeParam(
                                                      getJsonField(
                                                        pointDetailVisitPointVisiteAPIResponse
                                                            .jsonBody,
                                                        r'''$.next_itin.point_interest.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              } else {
                                                context.pushNamed(
                                                  'Step',
                                                  queryParameters: {
                                                    'idVisite': serializeParam(
                                                      widget.idVisite,
                                                      ParamType.int,
                                                    ),
                                                    'idItinerary':
                                                        serializeParam(
                                                      getJsonField(
                                                        pointDetailVisitPointVisiteAPIResponse
                                                            .jsonBody,
                                                        r'''$.next_itin.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                    'idStep': serializeParam(
                                                      getJsonField(
                                                        pointDetailVisitPointVisiteAPIResponse
                                                            .jsonBody,
                                                        r'''$.first_step''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            }
                                          },
                                          text: '',
                                          icon: FaIcon(
                                            FontAwesomeIcons.longArrowAltRight,
                                          ),
                                          options: FFButtonOptions(
                                            width: 190.0,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color: Colors.white,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: NavbarBottomWidget(
                                              pointInVisit: getJsonField(
                                                pointDetailVisitPointVisiteAPIResponse
                                                    .jsonBody,
                                                r'''$.list_points''',
                                              )!,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  text: '',
                                  icon: Icon(
                                    Icons.menu,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 50.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
