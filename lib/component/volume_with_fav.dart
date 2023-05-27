import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:wearable_rotary/wearable_rotary.dart';

class VolumeAndFav extends StatefulWidget {
  const VolumeAndFav({super.key});

  @override
  State<VolumeAndFav> createState() => _VolumeAndFavState();
}

class _VolumeAndFavState extends State<VolumeAndFav> {
  late final StreamSubscription<RotaryEvent> rotarySubscription;
  double volume = 25.0;

  @override
  void initState() {
    rotarySubscription = rotaryEvents.listen(handleRotaryEvent);
    super.initState();
  }

  @override
  void dispose() {
    rotarySubscription.cancel();
    super.dispose();
  }

  void handleRotaryEvent(RotaryEvent event) {
    if (event.direction == RotaryDirection.clockwise) {
      if (volume < 100) {
        setState(() => volume++);
      }
    } else {
      if (volume > 0) {
        setState(
          () => volume--,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: WatchShape(builder: (context, shape, _) {
        bool isRound = shape == WearShape.round;
        return Row(
          mainAxisAlignment: isRound
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AmbientMode(builder: (context, mode, _) {
                    bool isAmbient = mode == WearMode.ambient;
                    return CircularProgressIndicator(
                      value: volume / 100,
                      color: isAmbient ? Colors.transparent : Colors.white,
                      backgroundColor: Colors.grey,
                      strokeWidth: 1.2,
                    );
                  }),
                  const Icon(
                    CupertinoIcons.speaker_2_fill,
                    color: Colors.grey,
                    size: 14,
                  )
                ],
              ),
            ),
            if (!isRound)
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
        );
      }),
    );
  }
}
