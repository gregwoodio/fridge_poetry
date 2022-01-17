import 'package:flutter/material.dart';

class Magnet extends StatelessWidget {
  final String word;

  const Magnet(this.word, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: word,
      feedback: Transform.rotate(angle: -0.1, child: _createMagnet()),
      child: _createMagnet(),
      childWhenDragging: Container(),
    );
  }

  Widget _createMagnet() {
    return Container(
      width: 100,
      height: 30,
      child: Center(
        child: Text(
          word,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
    );
  }
}
