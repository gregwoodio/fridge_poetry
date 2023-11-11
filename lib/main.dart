import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fridge_poetry/wordlist.dart';

import 'widgets/magnet.dart';

class MagnetInfo {
  double x;
  double y;
  String word;

  MagnetInfo(this.x, this.y, this.word);
}

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
      home: Container(child: const Fridge()),
    );
  }
}

class Fridge extends StatefulWidget {
  const Fridge({Key? key}) : super(key: key);

  @override
  State<Fridge> createState() => _FridgeState();
}

class _FridgeState extends State<Fridge> {
  late List<MagnetInfo> magnets = [];

  @override
  Widget build(BuildContext context) {
    if (magnets.isEmpty) {
      _initMagnets(context);
    }

    return Scaffold(
      body: DragTarget(
        builder: (context, candidateItems, rejectedItems) {
          return Stack(
            children: magnets.map((MagnetInfo magnet) {
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
              magnets.firstWhere((magnet) => magnet.word == onMove.data);
          magnet.x = onMove.offset.dx;
          magnet.y = onMove.offset.dy;
        },
      ),
    );
  }

  void _initMagnets(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final rnd = Random();
      final size = context.size ?? const Size(800, 600);

      setState(() {
        magnets = words
            .map(
              (word) => MagnetInfo(
                rnd.nextDouble() * size.width,
                rnd.nextDouble() * size.height,
                word,
              ),
            )
            .toList();
      });
    });
  }
}
