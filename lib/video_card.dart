import 'package:flutter/material.dart';
import 'package:flutter_interactive_video_grid/video_details.dart';
import 'package:flutter_interactive_video_grid/video_item_model.dart';
import 'package:flutter_interactive_video_grid/video_thumbnail.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatelessWidget {
  final VideoItemModel videoItem;
  final VideoPlayerController? controller;
  final bool isPlaying;

  const VideoCard({
    super.key,
    required this.videoItem,
    this.controller,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoThumbnail(controller: controller, isPlaying: isPlaying),
            VideoDetails(
                title: videoItem.title, description: videoItem.description),
          ],
        ),
      ),
    );
  }
}
