// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ListWhoIAm extends StatefulWidget {
  const ListWhoIAm({
    Key? key,
    this.width,
    this.height,
    this.boldText,
    this.normalText,
    this.iconParam,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? boldText;
  final String? normalText;
  final Widget? iconParam;

  @override
  _ListWhoIAmState createState() => _ListWhoIAmState();
}

class _ListWhoIAmState extends State<ListWhoIAm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Row(
        children: [
          Padding(
            padding:
                EdgeInsets.fromLTRB(12.0, 0, 12.0, 12.0), // Remove top padding
            child: Align(
              alignment: Alignment.topCenter,
              child: widget.iconParam,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Align children at the start vertically
              children: [
                Text(
                  widget.boldText!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.normalText!,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
