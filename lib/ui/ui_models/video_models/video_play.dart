import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/video_bloc/video_bloc.dart';
import 'package:test_video_player/bloc/volume_bloc/volume_bloc.dart';
import 'package:test_video_player/ui/ui_models/video_models/function_for_show_and_dissapeare.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatelessWidget {
  const VideoPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        if (state is VideoLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is VideoPlayState) {
          final controller = state.controller;
          final isMuted = context.watch<VolumeBloc>().state.isMuted;
          controller.setVolume(isMuted ? 0.0 : 1.0);

          return GestureDetector(
            onTap: () {
              onShowAndDissapeare(context);
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          );
        }
        return Placeholder();
      },
    );
  }
}
