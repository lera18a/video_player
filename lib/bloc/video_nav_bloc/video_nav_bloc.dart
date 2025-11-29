import 'dart:async';

import 'package:bloc/bloc.dart';

part 'video_nav_event.dart';
part 'video_nav_state.dart';

class VideoNavBloc extends Bloc<VideoNavEvent, VideoNavState> {
  Timer? timer;
  VideoNavBloc() : super(VideoNavState(turnOn: true)) {
    on<ShowNavEvent>(_onShowNavEvent);
    on<DissapeareNavEvent>(_onDissapeareNavEvent);
    on<PlayNavEvent>(_onPlayNavEvent);
  }

  void _cancelTimer() {
    timer?.cancel();
    timer = null;
  }

  void _onShowNavEvent(ShowNavEvent event, Emitter<VideoNavState> emit) {
    _cancelTimer();
    emit(VideoNavState(turnOn: true));
  }

  void _onDissapeareNavEvent(
    DissapeareNavEvent event,
    Emitter<VideoNavState> emit,
  ) {
    _cancelTimer();
    emit(VideoNavState(turnOn: false));
  }

  void _onPlayNavEvent(PlayNavEvent event, Emitter<VideoNavState> emit) {
    emit(VideoNavState(turnOn: true));
    _cancelTimer();
    timer = Timer(Duration(seconds: 1), () {
      add(DissapeareNavEvent());
    });
  }

  @override
  Future<void> close() {
    _cancelTimer();
    return super.close();
  }
}
