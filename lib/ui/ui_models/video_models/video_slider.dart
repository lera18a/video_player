import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/video_bloc/video_bloc.dart';

class VideoSlider extends StatelessWidget {
  const VideoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        if (state is VideoLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is! VideoPlayState) {
          return const SizedBox.shrink();
        }
        final controller = state.controller;

        if (!controller.value.isInitialized) {
          return const SizedBox.shrink();
        }

        final position = state.position;
        final duration = controller.value.duration;

        final currentSeconds = position.inSeconds.toDouble();
        final totalSeconds = duration.inSeconds == 0
            ? 1.0
            : duration.inSeconds.toDouble();

        return Container(
          height: 23,
          decoration: BoxDecoration(
            color: Color(0X80E0E7FF),
            borderRadius: BorderRadius.circular(100),
          ),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
            ),
            child: Slider(
              padding: .symmetric(horizontal: 8, vertical: 9.5),
              value: currentSeconds.clamp(0, totalSeconds),
              min: 0,
              max: totalSeconds,
              thumbColor: Colors.white,
              activeColor: Color(0xffD1D5DB),
              inactiveColor: Color(0xffD1D5DB),
              onChanged: (newValue) =>
                  controller.seekTo(Duration(seconds: newValue.toInt())),
            ),
          ),
        );
      },
    );
  }
}
