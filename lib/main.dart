
import 'package:flutter/material.dart';

import 'dice_game.dart';
import 'features/presentation/dice_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DicePage(),
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
    );
  }
}


