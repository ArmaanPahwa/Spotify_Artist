import 'package:flutter/material.dart';
import 'home page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  //You can make a .env file that DotEnv will load from
  //the file is structured as such
  /* 
  CLIENT_ID = 'dx...f12'
  CLIENT_SECRET = 'ud...ad'
  */
  DotEnv.load(fileName: ".env");
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
