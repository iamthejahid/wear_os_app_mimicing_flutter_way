import 'package:flutter/material.dart';

class MusicController extends StatelessWidget {
  const MusicController({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.fast_rewind,
          color: Colors.grey,
          size: 16,
        ),
        Icon(
          Icons.pause_circle_outlined,
          color: Colors.grey,
          size: 32,
        ),
        Icon(
          Icons.fast_forward,
          color: Colors.grey,
          size: 16,
        ),
      ],
    );
  }
}
