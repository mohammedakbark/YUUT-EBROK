
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yuutebrok/Const/media.dart';

class ControllerVideoPlayer with ChangeNotifier {
  late VideoPlayerController videoPlayerController;

  Future initializeController() async {
    videoPlayerController = VideoPlayerController.asset(homeVideoasset,
        videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then((value) {
        videoPlayerController.setLooping(true);
        videoPlayerController.play();

        videoPlayerController.setVolume(0);
      });
  }

  disposeController() {
    videoPlayerController.dispose();
  }

  //----------------------------animation controller
}
