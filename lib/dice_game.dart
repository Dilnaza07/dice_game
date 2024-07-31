import 'dart:ui';

import 'package:dice_game/dice_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DicePage1 extends StatelessWidget {
  const DicePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DiceNotifier>(
      create: (context) => DiceNotifier(),
      child: DiceGame(),
    );
  }
}

class DiceGame extends StatelessWidget {
  const DiceGame({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<DiceNotifier>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice Game',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DicesWidget(),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                padding: EdgeInsets.all(16),
              ),
              onPressed: notifier.rollTheDice,
              child: Text(
                'Roll the Dice',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DicesWidget extends StatelessWidget {
  const DicesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final index1 = context.watch<DiceNotifier>().index1;
    final index2 = context.watch<DiceNotifier>().index2;
    final List images = context.watch<DiceNotifier>().images;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(images[index1]),
          ),
        ),
        Container(
          height: 150,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(images[index2]),
          ),
        ),
      ],
    );
  }
}
