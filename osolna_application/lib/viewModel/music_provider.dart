import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

class MusicProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioCache _audioCache = AudioCache();
  Duration totalDuration = const Duration();
  Duration position = const Duration();
  String audioState = '';

  MusicProvider() {
    initAudio();
  }

  /// [InitAudio]
  Future<StreamSubscription<PlayerState>> initAudio() async {
    _audioPlayer.onDurationChanged.listen(
      (updatedDuration) {
        totalDuration = updatedDuration;
        notifyListeners();
      },
    );

    _audioPlayer.onAudioPositionChanged.listen(
      (updatedPosition) {
        position = updatedPosition;
        notifyListeners();
      },
    );

    StreamSubscription<PlayerState> state =
        _audioPlayer.onPlayerStateChanged.listen(
      (playerState) {
        if (playerState == PlayerState.STOPPED) audioState = "Stopped";
        if (playerState == PlayerState.PLAYING) audioState = "Playing";
        if (playerState == PlayerState.PAUSED) audioState = "Paused";
      },
    );
    notifyListeners();
    return state;
  }

  /// [PlayAudio Method]
  Future<AudioPlayer> playAudio(String fileName) async {
    try {
      AudioPlayer _audioPlayer = await _audioCache.play(fileName);
      notifyListeners();
      return _audioPlayer;
    } catch (e) {
      print(e);
    }
    return _audioPlayer;
  }

  Future<int> pauseAudio() async {
    try {
      int pause = await _audioPlayer.pause();
      notifyListeners();
      return pause;
    } catch (e) {
      print(e);
    }
    // ignore: null_check_always_fails
    return null!;
  }

  stopAudio() {
    _audioPlayer.stop();
    notifyListeners();
  }
}
