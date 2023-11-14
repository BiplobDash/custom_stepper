import 'package:flutter/material.dart';
import 'package:flutter_stepper/stepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StepperScreen(),
    );
  }
}


// Biplob♡《❤️🍭𐌱𝒊ᴩ𝐥ѻ𝐛🍭❤》♡

