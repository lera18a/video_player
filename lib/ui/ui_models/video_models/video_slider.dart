import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/video_bloc/video_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoSlider extends StatefulWidget {
  const VideoSlider({super.key, required this.controller});
  final VideoPlayerController? controller;

  @override
  State<VideoSlider> createState() => _VideoSliderState();
}

class _VideoSliderState extends State<VideoSlider> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        final controller = widget.controller!;
        final position = state is VideoPlayState
            ? state.position
            : Duration.zero;
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
              onChanged: (newValue) {},
              onChangeEnd: (value) =>
                  controller.seekTo(Duration(seconds: value.toInt())),
            ),
          ),
        );
      },
    );
  }
}
