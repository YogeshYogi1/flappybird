import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  final double height;
  const MyBarrier({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, -0.3),
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(width: 5, color: Colors.green.shade900),
        borderRadius: BorderRadius.circular(10),
      ),
      height: height,
      width: 70,
    );
  }
}
