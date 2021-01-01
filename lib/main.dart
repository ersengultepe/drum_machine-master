import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    voiceButton('bip', Colors.deepOrange),
                    SizedBox(
                      width: 10,
                    ),
                    voiceButton('bongo', Colors.blueAccent),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    voiceButton('clap1', Colors.greenAccent),
                    SizedBox(
                      width: 10,
                    ),
                    voiceButton('crash', Colors.yellowAccent),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    voiceButton('clap2', Colors.purpleAccent),
                    SizedBox(
                      width: 10,
                    ),
                    voiceButton('how', Colors.brown),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    voiceImage('clap3', Colors.black54),
                    SizedBox(
                      width: 10,
                    ),
                    voiceButton('oobah', Colors.lime),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

AudioPlayer audioPlayer;
AudioCache audioCache = AudioCache();

playLocal(String voice) async {
  try {
    audioPlayer = await audioCache.play(voice + ".wav"); //audio play function
  } catch (Exception) {
    print(Exception.toString());
  }
}

stopAudio() async {
  if (audioPlayer != null) {
    await audioPlayer.stop();
  }
}

Expanded voiceButton(String voice, Color color) {
  return Expanded(
    child: FlatButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(34.0),
          side: BorderSide(color: Colors.black45)),
      height: 150,
      minWidth: 180,
      onPressed: () {
        stopAudio();
        playLocal(voice);
      },
      child: Text(
        voice.toUpperCase(),
      ),
      color: color,
    ),
  );
}

Expanded voiceImage(String voice, Color color) {
  return Expanded(
    child: FlatButton(
      height: 150,
      minWidth: 180,
      onPressed: () {
        stopAudio();
        playLocal(voice);
      },
      child: Image.asset(
        "assets/chick.png",
        height: 130,
      ),
      color: color,
    ),
  );
}
