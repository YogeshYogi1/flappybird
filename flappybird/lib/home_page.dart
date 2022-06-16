import 'dart:async';
import 'package:flappybird/barrier.dart';
import 'package:flappybird/score.dart';
import 'package:flutter/material.dart';

import 'bird.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double barrierXone = 0.5;
  double barrierXtwo = barrierXone + 1.5;
  int score = 0;
  late int seconds = 60;

  void startGame() {
    isgamestarted = true;
    Timer.periodic(
      const Duration(milliseconds: 1000),
      (timer) {
        score++;
      },
    );

    Timer.periodic(
      const Duration(milliseconds: 80),
      (timer) {
        time += 0.05;
        height = -4.9 * time * time + 2.8 * time;
        setState(
          () {
            if (barrierXone < -1.1) {
              barrierXone += 2.3;
            } else {
              barrierXone -= 0.05;
            }
          },
        );
        setState(
          () {
            if (barrierXtwo < -1.1) {
              barrierXtwo += 2.3;
            } else {
              barrierXtwo -= 0.05;
            }
          },
        );

        setState(
          () {
            barrierXone -= 0.03;
            barrierXtwo -= 0.03;
            birdYaxis = initialheight - height;
          },
        );
        if (birdYaxis > 1) {
          timer.cancel();
          isgamestarted = false;
        }
      },
    );
  }

  void jump() {
    setState(() {
      time = 0;
      initialheight = birdYaxis;
    });
  }

  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialheight = birdYaxis;
  bool isgamestarted = false;
  int bestscore = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isgamestarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(0, birdYaxis),
                    child: const MyBird(),
                    color: Colors.blue,
                    duration: const Duration(milliseconds: 0),
                  ),
                  Container(
                    alignment: const Alignment(0, -0.3),
                    child: isgamestarted
                        ? const Text('')
                        : const Text(
                            'TAP TO PLAY',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXone, 1.5),
                    duration: const Duration(milliseconds: 0),
                    child: const MyBarrier(height: 160),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXone, -1.5),
                    duration: const Duration(milliseconds: 0),
                    child: const MyBarrier(height: 160),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXtwo, 1.5),
                    duration: const Duration(milliseconds: 0),
                    child: const MyBarrier(height: 200),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(barrierXtwo, -1.5),
                    duration: const Duration(milliseconds: 0),
                    child: const MyBarrier(height: 120),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.green,
              height: 13,
              width: double.maxFinite,
            ),
            Expanded(
              child: BottomScore(
                score: score.toString(),
                best: bestscore.toString(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          backgroundColor: Colors.black,
          onPressed: () {
            if (score > bestscore) {
              bestscore = score;
            }
            setState(
              () {
                score = 0;
                birdYaxis = 0;
                jump();
              },
            );
          },
        ),
      ),
    );
  }
}
