import 'package:flutter/material.dart';
import 'package:test_video_player/ui/pages/desription_part_portrait.dart';
import 'package:test_video_player/ui/pages/video_part_portrait.dart';
import 'package:video_player/video_player.dart';

class PortraitVideoPage extends StatelessWidget {
  const PortraitVideoPage({super.key, required this.controller});
  final VideoPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26.0),
      child: Column(
        children: [
          VideoPartPortrait(controller: controller!),
          SizedBox(height: 28),
          DesriptionPartPortrait(),
        ],
      ),
    );
  }
}
