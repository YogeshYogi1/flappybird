import 'package:flutter/material.dart';

class BottomScore extends StatelessWidget {
  final String score;
  final String best;
  const BottomScore({
    Key? key,
    this.score = '0',
    this.best = '0',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Score',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                score,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Best',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                best,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
