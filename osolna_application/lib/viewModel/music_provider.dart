import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

class MusicProvider extends ChangeNotifier {
  final AudioCache _audioCache = AudioCache();
  final AudioPlayer _audioPlayer = AudioPlayer();

  /// [PlayMusic Method]
  Future<AudioPlayer> playMusic(selectMusic) async {
    notifyListeners();
    return await _audioCache.play(selectMusic);
  }

  void stopMusic() {
    _audioPlayer.stop();
    notifyListeners();
  }

  void pauseMusic() {
    _audioPlayer.pause();
    notifyListeners();
  }
}
