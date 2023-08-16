// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:audioplayers/audioplayers.dart'; // Import the audioplayers package

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _NewCustomWidgetState createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  String? myUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Your other widgets here
        ElevatedButton(
          onPressed: () {
            if (myUrl != null) {
              if (audioPlayer.state == PlayerState.playing) {
                audioPlayer.pause();
              } else {
                audioPlayer.play(UrlSource(
                    "https://interactive-examples.mdn.mozilla.net/media/cc0-audio/t-rex-roar.mp3"));
              }
            }
          },
          child: audioPlayer.state == PlayerState.playing
              ? Text('Pause')
              : Text('Play'),
        ),
      ],
    );
  }
}
