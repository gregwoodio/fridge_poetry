import 'package:flutter/material.dart';

import 'widgets/magnet.dart';

class MagnetInfo {
  double x;
  double y;
  String word;

  MagnetInfo(this.x, this.y, this.word);
}

List<MagnetInfo> _magnets = [
  MagnetInfo(10, 10, "hello"),
  MagnetInfo(30, 30, "world"),
  MagnetInfo(50, 50, "drink"),
  MagnetInfo(70, 70, "coffee"),
  MagnetInfo(90, 90, "beer"),
  MagnetInfo(110, 110, "code"),
  MagnetInfo(130, 130, "read"),
  MagnetInfo(150, 150, "write"),
  MagnetInfo(170, 170, "work"),
  MagnetInfo(190, 190, "play"),
  MagnetInfo(210, 210, "no"),
  MagnetInfo(230, 230, "yes"),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fridge Poetry',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Fridge(),
    );
  }
}

class Fridge extends StatelessWidget {
  const Fridge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DragTarget(
        builder: (context, candidateItems, rejectedItems) {
          return Stack(
            children: _magnets.map((MagnetInfo magnet) {
              return Positioned(
                child: Magnet(magnet.word),
                left: magnet.x,
                top: magnet.y,
              );
            }).toList(),
          );
        },
        onMove: (onMove) {
          var magnet =
              _magnets.firstWhere((magnet) => magnet.word == onMove.data);
            magnet.x = onMove.offset.dx;
            magnet.y = onMove.offset.dy;
        },
      ),
    );
  }
}
