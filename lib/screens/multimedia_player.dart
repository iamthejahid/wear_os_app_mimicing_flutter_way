import 'package:flutter/material.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';
import 'package:wear/wear.dart';
import 'package:wear_app/component/music_controller.dart';
import 'package:wear_app/component/volume_with_fav.dart';

class MultiMediaPlayer extends StatefulWidget {
  const MultiMediaPlayer({super.key});

  @override
  State<MultiMediaPlayer> createState() => _MultiMediaPlayerState();
}

class _MultiMediaPlayerState extends State<MultiMediaPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AmbientMode(builder: (context, mode, _) {
        bool isAmbient = mode == WearMode.ambient;
        return Opacity(
          opacity: isAmbient ? 0.6 : 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SquarePercentIndicator(
                height: 60,
                width: 60,
                progress: 0.6,
                borderRadius: 8,
                progressWidth: 3,
                shadowColor: Colors.white,
                progressColor: isAmbient ? Colors.transparent : Colors.orange,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  child: Image.asset("assets/alizee.jpg"),
                ),
              ),
              Text(
                "Moi… Lolita",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const MusicController(),
              const VolumeAndFav()
            ],
          ),
        );
      }),
    );
  }
}
