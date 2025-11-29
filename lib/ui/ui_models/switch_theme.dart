import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/theme_bloc/theme_bloc.dart';
import 'package:test_video_player/video_player_icons_icons.dart';

class SwitchThemeSettings extends StatelessWidget {
  const SwitchThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final isDark = state.isDark;

        return Padding(
          padding: .only(right: 16),
          child: Container(
            width: 96,
            height: 54,
            decoration: BoxDecoration(
              color: Color(0x80E0E7FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onTap: () {
                context.read<ThemeBloc>().add(ToggleThemeEvent());
              },
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 64,
                  height: 34,
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: isDark ? Color(0xff73C0FC) : Color(0xff004884),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            VideoPlayerIcons.moon,
                            size: 24,
                            color: Color(0xff73C0FC),
                          ),
                          Icon(
                            VideoPlayerIcons.sun,
                            size: 24,
                            color: Color(0xffFFD43B),
                          ),
                        ],
                      ),
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 200),
                        alignment: isDark
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
