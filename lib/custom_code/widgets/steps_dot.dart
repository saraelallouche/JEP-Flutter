// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StepsDot extends StatefulWidget {
  const StepsDot({
    Key? key,
    this.width,
    this.height,
    this.totalDots,
    this.activeDots,
    this.currentDot,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int? totalDots;
  final int? activeDots;
  final int? currentDot;

  @override
  _StepsDotState createState() => _StepsDotState();
}

class _StepsDotState extends State<StepsDot> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: RatingBarIndicator(
        itemBuilder: (context, index) => FaIcon(
          FontAwesomeIcons.solidCircle,
          color: FlutterFlowTheme.of(context).primary,
        ),
        direction: Axis.horizontal,
        rating: widget.activeDots?.toDouble() ?? 0.0,
        unratedColor: FlutterFlowTheme.of(context).accent3,
        itemCount: widget.totalDots ?? 0,
        itemPadding: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
        itemSize: 15,
      ),
    );
  }
}
