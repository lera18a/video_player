import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/data_bloc/data_bloc.dart';
import 'package:test_video_player/ui/ui_models/like_or_dislike_icon.dart';
import 'package:test_video_player/ui/ui_models/video_models/text_description_model.dart';
import 'package:test_video_player/ui/ui_models/video_models/text_title_model.dart';
import 'package:test_video_player/video_player_icons_icons.dart';

class DesriptionPartPortrait extends StatelessWidget {
  const DesriptionPartPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: .symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    if (state is DataLoadedVideo)
                      TextTitleModel(title: state.modelVideo.title),
                    LikeOrDislikeIcon(
                      onPressed: () {},
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(18),
                      ),
                      icon: VideoPlayerIcons.like,
                    ),
                    LikeOrDislikeIcon(
                      onPressed: () {},
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(18),
                      ),
                      icon: VideoPlayerIcons.dislike,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListView(
                      padding: .all(0),
                      children: [
                        if (state is DataLoadedVideo)
                          TextDescriptionModel(
                            description: state.modelVideo.description,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
