import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VolumeAndFav extends StatelessWidget {
  const VolumeAndFav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 24,
            width: 24,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: 0.4,
                  color: Colors.white,
                  backgroundColor: Colors.grey,
                  strokeWidth: 1.2,
                ),
                Icon(
                  CupertinoIcons.speaker_2_fill,
                  color: Colors.grey,
                  size: 14,
                )
              ],
            ),
          ),
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 1.2,
              ),
            ),
            child: const Icon(
              CupertinoIcons.heart,
              color: Colors.grey,
              size: 14,
            ),
          )
        ],
      ),
    );
  }
}
