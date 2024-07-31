import 'dart:math';

import 'package:flutter/material.dart';

class DiceNotifier extends ChangeNotifier {
  List images = [
    'assets/d1.jpg',
    'assets/d1.jpg',
    'assets/d3.png',
    'assets/d4.png',
    'assets/d5.jpg',
    'assets/d6.png'
  ];

  int index1 = 0;
  int index2 = 0;

  Random random = new Random();


  void rollTheDice(){

    index1 = random.nextInt(6);
    index2 = random.nextInt(6);

    notifyListeners();
  }
}


