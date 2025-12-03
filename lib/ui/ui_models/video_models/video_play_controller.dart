import 'package:video_player/video_player.dart';

class VideoPlayController {
  VideoPlayerController? _controller;

  VideoPlayerController? get controller => _controller;

  bool get isInitialized => _controller?.value.isInitialized ?? false;

  Future<void> init(String url, {Duration? startPosition}) async {
    await dispose();

    _controller = VideoPlayerController.networkUrl(Uri.parse(url));
    await _controller!.initialize();

    if (startPosition != null) {
      await _controller!.seekTo(startPosition);
    }
  }

  void play() => _controller?.play();
  void pause() => _controller?.pause();
  void seekTo(Duration pos) => _controller?.seekTo(pos);

  Duration get position => _controller?.value.position ?? Duration.zero;
  Duration get duration => _controller?.value.duration ?? Duration.zero;

  Future<void> dispose() async {
    await _controller?.dispose();
    _controller = null;
  }
}
