import 'package:flutter/material.dart';

import 'package:spotify_artist/api-connection/spotify_auth.dart';
import 'package:spotify_artist/api-connection/authorization_token.dart';
import 'package:spotify_artist/api-connection/spotify_api_search.dart';
import 'package:spotify_artist/data-models/artist.dart';

class SpotifyArtistHomePage extends StatefulWidget {
  SpotifyArtistHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SpotifyArtistHomePage createState() => _SpotifyArtistHomePage();
}

class _SpotifyArtistHomePage extends State<SpotifyArtistHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Color(0xFF1DB954),
        centerTitle: true,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
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

class DataSearch extends SearchDelegate<String> {
  var suggestedEntries = [
    "Entry 1",
    "Entry 2",
    "Artist 1",
  ];

  Future<List> _buildAPIResults() async {
    AuthorizationToken authorizationToken =
        await SpotifyAuth.getAuthenticationToken();
    var artistList =
        await SpotifyApiSearch.getArtistSearchList(authorizationToken, query);
    return artistList;
  }

  //Creates the clear search query
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  //Creates back button from search
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == "") {
      return Center(
        child: Text('Please enter a valid name'),
      );
    }
    return FutureBuilder(
        future: _buildAPIResults(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            List<Widget> children = const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Search in progress...'),
              )
            ];
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.person_search),
                title: Text(snapshot.data[index].getArtistName()),
                onTap: () {},
              ),
              itemCount: snapshot.data.length,
            );
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = suggestedEntries;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.update),
        title: Text(suggestionList[index]),
        onTap: () {},
      ),
      itemCount: suggestionList.length,
    );
  }
}
