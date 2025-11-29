part of 'video_nav_bloc.dart';

sealed class VideoNavEvent {}

class ShowNavEvent extends VideoNavEvent {}

class DissapeareNavEvent extends VideoNavEvent {}

class PlayNavEvent extends VideoNavEvent {}
