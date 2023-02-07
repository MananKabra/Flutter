import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playSound(int soundNumber){
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded soundButton({required colour,required int soundNumber}){
  return Expanded(
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: colour,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed: () {
        playSound(soundNumber);
      },
      child: Container(
      ),
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            soundButton(colour: Colors.red, soundNumber: 1),
            soundButton(colour: Colors.orange, soundNumber: 2),
            soundButton(colour: Colors.yellow, soundNumber: 3),
            soundButton(colour: Colors.green, soundNumber: 4),
            soundButton(colour: Colors.green[700], soundNumber: 5),
            soundButton(colour: Colors.blue, soundNumber: 6),
            soundButton(colour: Colors.blue[800], soundNumber: 7),
          ],
        )),
      ),
    );
  }
}
