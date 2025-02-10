import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoThumbnail extends StatelessWidget {
  final VideoPlayerController? controller;
  final bool isPlaying;

  const VideoThumbnail({super.key,
    this.controller,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (controller != null && controller!.value.isInitialized && isPlaying)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: VideoPlayer(controller!),
              ),
            )
          else
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                'https://www.sample-videos.com/img/Sample-png-image-200kb.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
        ],
      ),
    );
  }
}