import 'package:flutter/material.dart';
import 'package:spotify_artist/search menu.dart';

class SpotifyArtistHomePage extends StatefulWidget {
  final String title;

  SpotifyArtistHomePage({Key key, this.title}) : super(key: key);

  @override
  _SpotifyArtistHomePage createState() => _SpotifyArtistHomePage();
}

class _SpotifyArtistHomePage extends State<SpotifyArtistHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1DB954),
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchMenu());
              }),
        ],
      ),
      body: Center(
        child: Text('Please use the search icon to begin your artist search',
            style: TextStyle(fontSize: 16.0, color: Colors.white)),
      ),
    );
  }
}
