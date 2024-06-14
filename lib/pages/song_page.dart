import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_beats/components/neu_box.dart';
import 'package:my_beats/models.dart/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListProvider>(
      builder: (context, value, child) {
        // get playlist
        final playlist = value.playlist;

        // get current song index
        final currentSong = playlist[value.currentSongIndex ?? 0];

        // return scaffold UI
        return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        // appBar: AppBar(
        //   title: const Text('N O W  P L A Y I N G'),
        //   backgroundColor: Theme.of(context).colorScheme.primary,
        //   centerTitle: true,
        // ),
        body: SafeArea(
          child: Column(
            children: [
              //custom app bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // back button
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  // title
                  Text(
                    'NOW PLAYING',
                    style: TextStyle(
                        letterSpacing: 4,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  // menu button
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ],
              ),

              // album artwork
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    NeuBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                  currentSong.albumArtImagePath),
                            ),
                            //row for song and artist name and icon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //song and artist name
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      currentSong.songName,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontStyle: FontStyle.italic,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary),
                                    ),
                                    Text(
                                      currentSong.artistName,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.red.shade900,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // song duration progress
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // start time
                  Text(
                    '0:00',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),

                  // shuffle icon
                  NeuBox(
                    child: Icon(
                      Icons.shuffle_on_rounded,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 25,
                    ),
                  ),
                  // repeat time
                  NeuBox(
                    child: Icon(
                      Icons.repeat_on_rounded,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 25,
                    ),
                  ),
                  // end time
                  Text(
                    '0:00',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  )
                ],
              ),

              // song duration progress
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 5)),
                  child: Slider(
                      min: 0,
                      max: value.totalDuration.inSeconds.toDouble(),
                      value: value.currentDuration.inSeconds.toDouble(),
                      activeColor: const Color.fromARGB(255, 118, 163, 231),
                      inactiveColor: Colors.grey,
                      onChanged: (double double) {
                        //during when the user is sliding around
                      },
                      onChangeEnd: (double double) {
                        // sliding has finished, go to that position in song duration
                        value.seek(Duration(seconds: double.toInt()));
                      },
                      ),
                ),
              ),
              

              // playback controlls

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  children: [
                    // skip button
                    Expanded(
                      child: NeuBox(
                        child: IconButton(
                          onPressed: value.playPreviousSong,
                          icon:Icon(Icons.skip_previous_rounded,),
                          color: Theme.of(context).colorScheme.inversePrimary,
                          iconSize: 60,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    // play / pause
                   Expanded(
                    flex: 2,
                      child: NeuBox(
                        child: IconButton(
                          onPressed: value.pauseOrResume,
                          icon:Icon(value.isPlaying? Icons.pause: Icons.play_arrow_rounded,),
                          color: Theme.of(context).colorScheme.inversePrimary,
                          iconSize: 60,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    // skip forward
                   Expanded(
                      child: NeuBox(
                        child: IconButton(
                          onPressed: value.playNextSong,
                          icon:Icon(Icons.skip_next_rounded,),
                          color: Theme.of(context).colorScheme.inversePrimary,
                          iconSize: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      }
    );
  }
}
