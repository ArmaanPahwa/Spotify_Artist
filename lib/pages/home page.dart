import 'package:flutter/material.dart';
import 'package:spotify_artist/pages/search%20menu.dart';

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
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 22.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.width / 1.5,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset('assets/icon.jpeg')),
              ),
            ),
            Text(
              'Please use the search icon to begin your artist search',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
