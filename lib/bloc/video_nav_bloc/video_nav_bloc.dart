import 'package:bloc/bloc.dart';

part 'video_nav_event.dart';
part 'video_nav_state.dart';

class VideoNavBloc extends Bloc<VideoNavEvent, VideoNavState> {
  VideoNavBloc() : super(VideoNavState(turnOn: true)) {
    on<ShowNavEvent>(_onShowNavEvent);
    on<DissapeareNavEvent>(_onDissapeareNavEvent);
  }

  void _onShowNavEvent(ShowNavEvent event, Emitter<VideoNavState> emit) {
    emit(VideoNavState(turnOn: true));
  }

  void _onDissapeareNavEvent(
    DissapeareNavEvent event,
    Emitter<VideoNavState> emit,
  ) {
    emit(VideoNavState(turnOn: false));
  }
}
