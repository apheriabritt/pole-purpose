
import 'package:audioplayers/audio_cache.dart';


class PlaySound {
  playLocal(String path) {
    AudioCache().play(path);
  }

  playShuffle() {
    AudioCache().play("shuffle.mp3");
  }
}