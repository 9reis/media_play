// import 'dart:html';
// import 'dart:js_interop';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AudioFile extends StatefulWidget {
  const AudioFile({super.key, required this.advancedPlayer});

  final AudioPlayer advancedPlayer;

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = Duration();
  Duration _position = Duration();

  final String path =
      'https://soundcloud.com/danielcaesar/japanese-denim?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing';

  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;

  Color color = Colors.black;

  List<IconData> _icons = [
    Icons.play_circle_filled,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    this.widget.advancedPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    this.widget.advancedPlayer.setSourceUrl(path);
    this.widget.advancedPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if (isRepeat == true) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });
  }

  Widget btnStart() {
    return IconButton(
      padding: EdgeInsets.only(bottom: 10),
      icon: isPlaying == false
          ? Icon(
              _icons[0],
              size: 50,
              color: Colors.blue,
            )
          : Icon(
              _icons[1],
              size: 50,
              color: Colors.blue,
            ),
      onPressed: () {
        if (isPlaying == false) {
          this.widget.advancedPlayer.play(path as Source);
          setState(() {
            isPlaying = true;
          });
        } else if (isPlaying == true) {
          setState(() {
            this.widget.advancedPlayer.pause();
            isPlaying = false;
          });
        }
      },
    );
  }

  Widget btnFast() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/forward.png'),
        size: 15,
        color: Colors.black,
      ),
      onPressed: () {
        this.widget.advancedPlayer.setPlaybackRate(1.5);
      },
    );
  }

  Widget btnSlow() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/backword.png'),
      ),
      onPressed: () {
        this.widget.advancedPlayer.setPlaybackRate(0.5);
      },
    );
  }

  Widget btnLoop() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/loop.png'),
        size: 15,
        color: color,
      ),
      onPressed: () {},
    );
  }

  Widget btnRepeat() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/repeat.png'),
        size: 15,
        color: color,
      ),
      onPressed: () {
        if (isRepeat == false) {
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.loop);
          setState(() {
            isRepeat = true;
            color = Colors.blue;
          });
        } else if (isRepeat == true) {
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.release);
          color = Colors.black;
          isRepeat = false;
        }
      },
    );
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnRepeat(),
          btnSlow(),
          btnStart(),
          btnFast(),
          btnLoop(),
        ],
      ),
    );
  }

  Widget slider() {
    return Slider(
      activeColor: Colors.red,
      inactiveColor: Colors.grey,
      value: _position.inSeconds.toDouble(),
      min: 0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (value) {
        setState(() {
          changeToSecont(value.toInt());
          value = value;
        });
      },
    );
  }

  void changeToSecont(int second) {
    Duration newDuration = Duration();
    this.widget.advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position
                      .toString()
                      .split('.')[0], // Elimina todos os numeros após o ponto
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  _duration.toString().split('.')[0],
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          slider(),
          loadAsset(),
        ],
      ),
    );
  }
}

// <key>NSAppTransportSecurity</key>
// <dict>
// <key>NSAllowsArbitraryLoads</key>
// <true/>
// </dict>
