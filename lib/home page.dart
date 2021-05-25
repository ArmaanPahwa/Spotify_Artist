import 'package:flutter/material.dart';

import 'package:spotify_artist/api-connection/spotify_auth.dart';
import 'package:spotify_artist/api-connection/authorization_token.dart';
import 'package:spotify_artist/api-connection/spotify_api_search.dart';
import 'package:spotify_artist/artist%20page.dart';

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
    "John Mayer",
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
    query = query.trim();
    if (query == "") {
      return Center(
        child: Text('Please enter an artist name above'),
      );
    }

    if (!suggestedEntries.contains(query)) suggestedEntries.add(query);

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
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child:
                        Image.network(snapshot.data[index].getArtistImageUrl()),
                  ),
                  title: Text(snapshot.data[index].getArtistName()),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ArtistPage()));
                  },
                ),
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
        onTap: () {
          query = suggestionList[index];
        },
      ),
      itemCount: suggestionList.length,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext buildContext) {
    assert(buildContext != null);
    final ThemeData theme = Theme.of(buildContext);
    assert(theme != null);
    return ThemeData(
        primaryColor: Color(0xFF1DB954), brightness: Brightness.dark);
  }
}
