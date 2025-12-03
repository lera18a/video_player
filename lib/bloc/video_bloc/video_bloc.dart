import 'package:bloc/bloc.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  Duration currentPosition = Duration.zero;
  bool isPlaying = false;

  VideoBloc() : super(VideoLoadingState()) {
    on<VideoPlayEvent>(_onVideoPlayEvent);
    on<VideoInitEvent>(_onVideoInitEvent);
    on<VideoDateEvent>(_onVideoDateEvent);
    on<VideoPositionChanged>(_onVideoPositionChanged);
    add(VideoInitEvent());
  }

  Future<void> _onVideoInitEvent(
    VideoInitEvent event,
    Emitter<VideoState> emit,
  ) async {
    emit(VideoLoadingState());
    emit(VideoPlayState(onTap: false, position: Duration.zero));
  }

  Future<void> _onVideoPlayEvent(
    VideoPlayEvent event,
    Emitter<VideoState> emit,
  ) async {
    if (state is! VideoPlayState) return;
    final current = state as VideoPlayState;
    emit(VideoPlayState(onTap: !current.onTap, position: current.position));
  }

  void _onVideoDateEvent(VideoDateEvent event, Emitter<VideoState> emit) {
    if (state is! VideoPlayState) return;
    final current = state as VideoPlayState;
    emit(VideoPlayState(onTap: current.onTap, position: current.position));
  }

  void _onVideoPositionChanged(
    VideoPositionChanged event,
    Emitter<VideoState> emit,
  ) {
    if (state is VideoPlayState) {
      final current = state as VideoPlayState;
      if (current.position == event.position) return;
      emit(VideoPlayState(position: event.position, onTap: current.onTap));
    }
  }

  void updatePosition(Duration pos) => add(VideoPositionChanged(pos));
}
