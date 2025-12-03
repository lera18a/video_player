import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_video_player/ui/logic_ui/app_volume.dart';
import 'package:test_video_player/ui/ui_models/entities_icon.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_nav.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_play.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_slider.dart';
import 'package:test_video_player/video_player_icons_icons.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  final bool isFullScreen;
  final VideoPlayerController? controller;

  const VideoPage({super.key, required this.isFullScreen, this.controller});

  Future<void> _goFullScreen() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: .center,
          children: [
            VideoPlay(controller: controller!),
            VideoNav(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 34.5, horizontal: 16.0),
          child: SizedBox(
            height: 44,
            child: Row(
              children: [
                Expanded(child: VideoSlider(controller: controller)),
                SizedBox(width: 12),
                AppVolume(),
                SizedBox(width: 12),
                if (!isFullScreen)
                  EntitiesIcon(
                    onPressed: _goFullScreen,
                    icon: VideoPlayerIcons.bigscreen,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
