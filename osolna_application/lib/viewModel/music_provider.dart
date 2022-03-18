import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

/// [MusicFile Path]
const String happyMusicName = 'test.mp3';
const String loveMusicName = 'test.mp3';
const String consolationMusicName = 'test.mp3';
const String sadnessMusicName = 'test.mp3';
const String angryMusicName = 'test.mp3';

/// [MusicFile Path List]
List<String> fileNames = [
  happyMusicName,
  loveMusicName,
  consolationMusicName,
  sadnessMusicName,
  angryMusicName
];

class MusicProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioCache _audioPlayerCache = AudioCache();
  dynamic music;

  // ignore: slash_for_doc_comments
  /**
   * [AudiPlayer Music LoadAll]
   */
  Future<AudioCache?> audioInit() async {
    try {
      final List<Uri> music = await _audioPlayerCache.loadAll(fileNames);
    } catch (e) {}
    return null;
  }

  // ignore: slash_for_doc_comments
  /**
   * [MusicDeliver Method]
   */

  Future<Uri> deliverMusic(selectMoodText) async {
    if (selectMoodText == '행복') {
      return await _audioPlayerCache.load(fileNames[0]);
    } else if (selectMoodText == '사랑') {
      return await _audioPlayerCache.load(fileNames[1]);
    } else if (selectMoodText == '위로') {
      return await _audioPlayerCache.load(fileNames[2]);
    } else if (selectMoodText == '슬픔') {
      return await _audioPlayerCache.load(fileNames[3]);
    } else if (selectMoodText == '화남') {
      return await _audioPlayerCache.load(fileNames[4]);
    }
    // ignore: null_check_always_fails
    return null!;
  }

  // ignore: slash_for_doc_comments
  /**
   * [MusicPlay Method]
   */
  Future<void> playMusic(musicLoad) async {
    await _audioPlayerCache.play(musicLoad);
  }

  // ignore: slash_for_doc_comments
  /**
   * [MusicPause Method]
   */

  Future<void> pauseMusic() async {
    await _audioPlayer.pause();
  }
}
