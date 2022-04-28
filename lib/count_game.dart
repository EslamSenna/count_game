import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CountGame extends StatefulWidget {
  const CountGame({Key? key}) : super(key: key);

  @override
  State<CountGame> createState() => _CountGameState();
}

class _CountGameState extends State<CountGame> {
  List numbers = [
    'assets/numbers-01.jpg',
    'assets/numbers-02.jpg',
    'assets/numbers-03.jpg',
    'assets/numbers-04.jpg',
    'assets/numbers-05.jpg',
    'assets/numbers-06.jpg',
    'assets/numbers-07.jpg',
    'assets/numbers-08.jpg',
    'assets/numbers-09.jpg',
    'assets/numbers-10.jpg',
  ];

  List sounds = [
    '1.mp3',
    '2.mp3',
    '3.mp3',
    '4.mp3',
    '5.mp3',
    '6.mp3',
    '7.mp3',
    '8.mp3',
    '9.mp3',
    '10.mp3',
  ];

  int selected = 0;
  var player =
      AudioCache(fixedPlayer: AudioPlayer(mode: PlayerMode.MEDIA_PLAYER));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'تعلم العد',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                alignment: WrapAlignment.center,
                children: List.generate(
                    selected,
                    (index) => ZoomIn(
                        duration: const Duration(seconds: 1),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: Image.asset(
                            'assets/duck.jpg',
                            height: 120,
                            width: 120,
                          ),
                        ))),
              ),
            ),
            flex: 3,
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  10,
                  (index) => GestureDetector(
                        onTap: () {
                          player.play(sounds[index]);
                          if (index == 0) {
                            selected = 1;
                          } else if (index == 1) {
                            selected = 2;
                          } else if (index == 2) {
                            selected = 3;
                          } else if (index == 3) {
                            selected = 4;
                          } else if (index == 4) {
                            selected = 5;
                          } else if (index == 5) {
                            selected = 6;
                          } else if (index == 6) {
                            selected = 7;
                          } else if (index == 7) {
                            selected = 8;
                          } else if (index == 8) {
                            selected = 9;
                          } else {
                            selected = 10;
                          }
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: Border.all(
                                color: selected - 1 == index
                                    ? Colors.deepOrange
                                    : Colors.transparent,
                                width: 4),
                            elevation: 10,
                            child: Image.asset(
                              numbers[index],
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ),
                      )),
            ),
          ))
        ],
      ),
    );
  }
}
