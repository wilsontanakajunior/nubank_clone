import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDotApp extends StatelessWidget {
  final int currentIndex;
  final double top;
  Color getColors(int index) {
    return index == currentIndex ? Colors.white : Colors.white38;
  }

  const MyDotApp({Key? key, required this.currentIndex, required this.top})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              color: getColors(0),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              color: getColors(1),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 7,
            width: 7,
            decoration: BoxDecoration(
              color: getColors(2),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
