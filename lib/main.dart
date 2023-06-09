import 'package:flutter/material.dart';
import 'package:wear_app/screens/multimedia_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wear Media Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const MultiMediaPlayer(),
    );
  }
}
