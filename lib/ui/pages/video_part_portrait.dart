import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/settings_bloc/settings_bloc.dart';
import 'package:test_video_player/ui/logic_ui/app_volume.dart';
import 'package:test_video_player/ui/ui_models/entities_icon.dart';
import 'package:test_video_player/ui/ui_models/switch_theme.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_nav.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_play.dart';
import 'package:test_video_player/ui/ui_models/video_models/video_slider.dart';
import 'package:test_video_player/video_player_icons_icons.dart';
import 'package:video_player/video_player.dart';

class VideoPartPortrait extends StatelessWidget {
  const VideoPartPortrait({super.key, required this.controller});

  final VideoPlayerController? controller;

  Future<void> _goFullScreen() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: .end,
        mainAxisSize: .min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: EntitiesIcon(
              onPressed: () {
                context.read<SettingsBloc>().add(SettingsTapEvent());
              },
              icon: Icons.settings_outlined,
              size: 20,
            ),
          ),
          Stack(
            alignment: .topRight,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: .center,
                    children: [
                      VideoPlay(controller: controller),
                      VideoNav(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 34.5,
                      horizontal: 16.0,
                    ),
                    child: SizedBox(
                      height: 44,
                      child: Row(
                        children: [
                          Expanded(child: VideoSlider(controller: controller)),
                          SizedBox(width: 12),
                          AppVolume(),
                          SizedBox(width: 12),

                          EntitiesIcon(
                            onPressed: _goFullScreen,
                            icon: VideoPlayerIcons.bigscreen,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // VideoPage(isFullScreen: false),
              Column(
                mainAxisSize: .min,
                mainAxisAlignment: .end,
                children: [
                  BlocBuilder<SettingsBloc, SettingsState>(
                    builder: (context, state) {
                      if (!state.onTap) {
                        return SizedBox();
                      } else {
                        return SwitchThemeSettings();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
