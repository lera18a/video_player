import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/video_bloc/video_bloc.dart';
import 'package:test_video_player/bloc/video_nav_bloc/video_nav_bloc.dart';
import 'package:test_video_player/ui/ui_models/entities_icon.dart';
import 'package:test_video_player/ui/ui_models/video_models/function_for_show_and_dissapeare.dart';
import 'package:test_video_player/video_player_icons_icons.dart';

class VideoNav extends StatelessWidget {
  const VideoNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, videoState) {
        if (videoState is VideoLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (videoState is VideoPlayState) {
          return BlocBuilder<VideoNavBloc, VideoNavState>(
            builder: (context, videoPlayState) {
              return BlocBuilder<VideoNavBloc, VideoNavState>(
                builder: (context, state) {
                  if (!state.turnOn) {
                    return const SizedBox.shrink(); // панель скрыта
                  }
                  return Row(
                    mainAxisAlignment: .center,
                    children: [
                      EntitiesIcon(
                        onPressed: () {},
                        icon: VideoPlayerIcons.back,
                      ),
                      Padding(
                        padding: .symmetric(horizontal: 12.0),
                        child: EntitiesIcon(
                          onPressed: () {
                            context.read<VideoBloc>().add(VideoPlayEvent());
                            onShowAndDissapeare(context);
                          },
                          icon: videoState.onTap
                              ? Icons.pause
                              : VideoPlayerIcons.play,
                          size: 15.88,
                        ),
                      ),
                      EntitiesIcon(
                        onPressed: () {},
                        icon: VideoPlayerIcons.next,
                      ),
                    ],
                  );
                },
              );
            },
          );
        }
        return Placeholder();
      },
    );
  }
}
