import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/settings_bloc/settings_bloc.dart';
import 'package:test_video_player/ui/pages/fullscreen_video_page.dart';
import 'package:test_video_player/ui/pages/portrait_video_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return OrientationBuilder(
          builder: (context, orientation) {
            final isPortrait = orientation == Orientation.portrait;

            return Scaffold(
              backgroundColor: isPortrait
                  ? theme.scaffoldBackgroundColor
                  : Colors.black,
              body: SafeArea(
                bottom: isPortrait,
                child: isPortrait
                    ? PortraitVideoPage(theme: theme)
                    : FullScreenVideoPage(),
              ),
            );
          },
        );
      },
    );
  }
}
