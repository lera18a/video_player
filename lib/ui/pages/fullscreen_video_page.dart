import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/data_bloc/data_bloc.dart';
import 'package:test_video_player/ui/ui_models/entities_icon.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_nav.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_play.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_slider.dart';
import 'package:test_video_player/video_player_icons_icons.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPage extends StatelessWidget {
  final VideoPlayerController? controller;

  const FullScreenVideoPage({super.key, required this.controller});

  Future<void> _goPortraitScreen() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        return Stack(
          alignment: .center,
          children: [
            Positioned.fill(
              bottom: -26,
              child: VideoPlay(controller: controller),
            ),
            Center(child: const VideoNav()),
            Positioned(
              bottom: 34.5,
              left: 16,
              right: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: VideoSlider(controller: controller)),
                  const SizedBox(width: 24),
                  EntitiesIcon(
                    onPressed: _goPortraitScreen,
                    icon: VideoPlayerIcons.diagonal,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
