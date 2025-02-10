import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_interactive_video_grid/video_card.dart';
import 'package:flutter_interactive_video_grid/video_cubit.dart';
import 'package:flutter_interactive_video_grid/video_item_model.dart';
import 'package:video_player/video_player.dart';

class VideoGridItem extends StatefulWidget {
  final int index;
  final VideoItemModel videoItem;

  const VideoGridItem(
      {super.key, required this.index, required this.videoItem});

  @override
  _VideoGridItemState createState() => _VideoGridItemState();
}

class _VideoGridItemState extends State<VideoGridItem> {
  VideoPlayerController? _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    _controller = VideoPlayerController.network(widget.videoItem.url)
      ..initialize().then((_) {
        if (mounted) {
          context
              .read<VideoCubit>()
              .registerController(widget.index, _controller!);
          setState(() {
            _isLoading = false;
          });
        }
      });
  }

  @override
  void dispose() {
    _controller
        ?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, int?>(
      builder: (context, playingIndex) {
        final isPlaying = playingIndex ==
            widget.index;
        return GestureDetector(
          onPanDown: (_) {
            context
                .read<VideoCubit>()
                .playVideo(widget.index);
          },
          child: VideoCard(
            videoItem: widget.videoItem,
            controller: _controller,
            isPlaying: isPlaying,
          ),
        );
      },
    );
  }
}
