import 'package:flutter/material.dart';
import 'package:spotify_artist/data-models/artist.dart';

class ArtistPage extends StatefulWidget {
  final Artist artist;

  ArtistPage({Key key, this.artist}) : super(key: key);

  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF1DB954),
          brightness: Brightness.dark,
          centerTitle: true,
          title: Text('Artist Information')),
      body: Center(
        child: Text('You have reached: ${widget.artist.name} \'s page'),
      ),
    );
  }
}
