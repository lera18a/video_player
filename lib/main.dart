import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/settings_bloc/settings_bloc.dart';
import 'package:test_video_player/bloc/theme_bloc/theme_bloc.dart';
import 'package:test_video_player/bloc/video_bloc/video_bloc.dart';
import 'package:test_video_player/bloc/video_nav_bloc/video_nav_bloc.dart';
import 'package:test_video_player/bloc/volume_bloc/volume_bloc.dart';
import 'package:test_video_player/theme/theme.dart';
import 'package:test_video_player/ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => VolumeBloc()),
        BlocProvider(create: (context) => VideoNavBloc()),
        BlocProvider(create: (context) => VideoBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => SettingsBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themState.isDark ? ThemeMode.light : ThemeMode.dark,
            home: const HomePage(),
          );
        },
      ),
    ),
  );
}
