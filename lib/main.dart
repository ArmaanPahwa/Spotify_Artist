import 'package:flutter/material.dart';
import 'home page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Artist Search',
      home: SpotifyArtistHomePage(title: 'Spotify Artist Search'),
    );
  }
}
