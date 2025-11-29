import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_video_player/bloc/video_nav_bloc/video_nav_bloc.dart';

void onShowAndDissapeare(BuildContext context) {
  final navBloc = context.read<VideoNavBloc>();
  navBloc.add(ShowNavEvent());

  Future.delayed(Duration(seconds: 3), () {
    navBloc.add(DissapeareNavEvent());
  });
}
