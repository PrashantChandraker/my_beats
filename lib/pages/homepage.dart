import 'package:flutter/material.dart';
import 'package:my_beats/models.dart/playlist_provider.dart';
import 'package:my_beats/models.dart/songs.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import 'song_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get the playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    //get playlist provider
    playlistProvider = Provider.of<PlayListProvider>(context, listen: false);
  }

  //go to a song
  void goToSong(int songIndex) {
    // update current song index
    playlistProvider.currentSongIndex = songIndex;

    // navigate to song page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SongPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title:  Text(
          'MY PLAYLIST',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
              letterSpacing: 4, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      //consumers consumes the provider
      body: Consumer<PlayListProvider>(builder: (context, value, child) {
        //get the playlist
        final List<Song> playlist = value.playlist;

        //return list view UI
        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 5),
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: playlist.length,
          itemBuilder: (context, index) {
            //get individual song
            final Song song = playlist[index];

            // return list tile UI
            return ListTile(
              title: Text(
                song.songName,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  letterSpacing: 3,
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                song.artistName,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 13
                ),
              ),
              leading: Container(
                height: 80,
                width: 60,
                child: Image.asset(song.albumArtImagePath)),
              onTap: () => goToSong(index),
            );
          },
        );
      }),
    );
  }
}
