import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:media_play/audio_file.dart';

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({super.key});

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  AudioPlayer? advancedPlayer;

  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            height: screenHeight / 3,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight * 0.20,
            height: screenHeight * 0.36,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Text(
                    'THE WATER CURE',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Martin Hyatt',
                    style: TextStyle(fontSize: 20),
                  ),
                  AudioFile(advancedPlayer: advancedPlayer!),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.12,
            left: (screenWidth - 150) / 2,
            right: (screenWidth - 150) / 2,
            height: screenHeight * 0.16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                // border: Border.all(color: Colors.white, width: 2),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black26, width: 5),
                    image: DecorationImage(
                      image: AssetImage('assets/pic-1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //
          //
        ],
      ),
    );
  }
}
