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
  double nameFontSize = 32.0;
  double statisticTitleFontSize = 24.0;
  double statisticDataFontSize = 20.0;
  FontWeight statisticFontWeight = FontWeight.w400;

  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 22.0),
      child: Column(
        children: [
          Container(
              width: size.width / 1.5,
              height: size.width / 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(artist.imageUrl),
              )),
          Padding(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              "${artist.name}",
              style: TextStyle(
                  fontSize: nameFontSize, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Text("Followers",
                      style: TextStyle(
                          fontSize: statisticTitleFontSize,
                          fontWeight: statisticFontWeight)),
                  Text(
                    "${artist.followers}",
                    style: TextStyle(
                        fontSize: statisticDataFontSize,
                        fontWeight: statisticFontWeight),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  Text("Popularity",
                      style: TextStyle(
                          fontSize: statisticTitleFontSize,
                          fontWeight: statisticFontWeight)),
                  Text("${artist.popularity}",
                      style: TextStyle(
                          fontSize: statisticDataFontSize,
                          fontWeight: statisticFontWeight)),
                ],
              ))
            ],
          ),
        ],
      ),
    ),
  );
}
