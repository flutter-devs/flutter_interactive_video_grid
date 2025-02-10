import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoCubit extends Cubit<int?> {
  final Map<int, VideoPlayerController> _controllers = {};

  VideoCubit() : super(null);

  void registerController(int index, VideoPlayerController controller) {
    _controllers[index] = controller;
  }

  void playVideo(int index) {
    for (var entry in _controllers.entries) {
      if (entry.key == index) {
        entry.value.play();
      } else {
        entry.value.pause();
      }
    }
    emit(index);
  }

  void stopVideo() {
    for (var controller in _controllers.values) {
      controller.pause();
    }
    emit(null);
  }
}