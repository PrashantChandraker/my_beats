import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:my_beats/models.dart/songs.dart';

class PlayListProvider extends ChangeNotifier {
  //play list of songs

  final List<Song> _playlist = [
    //song 1
    Song(
        songName: 'Lehnga',
        artistName: 'Jass Manak',
        albumArtImagePath: 'assets/images/lehnga_poster2.jpg',
        audioPath: 'assets/audio/lehnga.mp3'),

    //song 1
    Song(
        songName: 'One Love',
        artistName: 'Subh',
        albumArtImagePath: 'assets/images/lehnga_poster.jpg',
        audioPath: 'assets/audio/lehnga.mp3'),

    //song 1
    Song(
        songName: 'Daru Badnam',
        artistName: 'Jassie Gill',
        albumArtImagePath: 'assets/images/lehnga_poster2.jpg',
        audioPath: 'assets/audio/lehnga.mp3')
  ];

  // current song playing index
  int? _currentSongIndex;

//////////// audio player  ///////////

//audio player
  final AudioPlayer _audioPlayer = AudioPlayer();
// duration
  Duration _currentDuation = Duration.zero;
  Duration _totalDuration = Duration.zero;

// constructor
  PlayListProvider() {
    listenToDuration();
  }
// iitially not playing
  bool _isPlaying = false;

// play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (currentSongIndex! < _playlist.length - 1) {
        //go to the next song if its not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if  its the last song, loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

//  play previous song
  void playPreviousSong() async {
    // if more tham 2 seconds have passed, restart the current song
    if (_currentDuation.inSeconds > 2) {
      seek(Duration.zero);
    }
    // if its within first 2 second of the song go to previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      }else{
        // if its the first song , loop back to the last song
        currentSongIndex = _playlist.length -1;
      }
    }
  }

// list to duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });
    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      notifyListeners();
    });
    // listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

// dispose audio player

  /////////// GETTERS  //////////////

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuation;
  Duration get totalDuration=> _totalDuration;

  /////////// SETTERS ///////////////

  set currentSongIndex(int? newIndex) {
    //update current song index
    _currentSongIndex = newIndex;
    if(newIndex!=null){
      play(); // play the song at the new index
    }

    //update UI
    notifyListeners();

    //
  }
}
