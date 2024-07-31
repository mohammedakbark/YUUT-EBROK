import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yuutebrok/Const/media.dart';

class ControllerVideoPlayer with ChangeNotifier {
  late VideoPlayerController videoPlayerController;

  initializeController() async {
    videoPlayerController = VideoPlayerController.asset(homeVideoasset,
        videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then((value) {
        videoPlayerController.setLooping(true);
        videoPlayerController.play();

        videoPlayerController.setVolume(0);
      });
  }

  Future<void> disposeController() async {
    await videoPlayerController.dispose();
    print('-----video disposed');
  }

  //----------------------------animation controller
}
