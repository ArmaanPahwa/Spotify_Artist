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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF1DB954),
          brightness: Brightness.dark,
          centerTitle: true,
          title: Text('Artist Information')),
      body: getBody(widget.artist, size),
    );
  }
}

Widget getBody(Artist artist, var size) {
  /*return Center(
    child: Text('You have reached: ${artist.name} \'s page'),
  );*/
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 22.0),
      child: Column(
        children: [
          Container(
              width: size.width / 1.5,
              height: size.width / 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.network(artist.imageUrl),
              )),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "${artist.name}",
              style: TextStyle(fontSize: 28),
            ),
          )
        ],
      ),
    ),
  );
}
