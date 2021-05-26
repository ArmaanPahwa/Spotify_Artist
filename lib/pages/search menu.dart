import 'package:flutter/material.dart';
import 'package:spotify_artist/api-connection/spotify_auth.dart';
import 'package:spotify_artist/api-connection/authorization_token.dart';
import 'package:spotify_artist/api-connection/spotify_api_search.dart';
import 'package:spotify_artist/pages/artist%20page.dart';

class SearchMenu extends SearchDelegate<String> {
  var suggestedEntries = [
    "John Mayer",
    "Aimer",
    "Khalid",
  ];

  var pastEntries = [];

  //Promises to return a List, used in the buildResults() function for a FutureWidget
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

  //Creates a basic search icon while the _buildAPIResults() runs. Once it returns a list
  //then the ListView is built
  @override
  Widget buildResults(BuildContext context) {
    query = query.trim();
    if (query == "") {
      return buildSuggestions(context);
    }
    if (!pastEntries.contains(query)) pastEntries.add(query);

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
                    child: Image.network(
                      snapshot.data[index].getArtistImageUrl(),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                  title: Text(snapshot.data[index].getArtistName()),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                new ArtistPage(artist: snapshot.data[index])));
                  },
                ),
              ),
              itemCount: snapshot.data.length,
            );
          }
        });
  }

  //Builds the suggsestions / history
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = pastEntries.isEmpty ? suggestedEntries : pastEntries;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading:
            pastEntries.isEmpty ? Icon(Icons.show_chart) : Icon(Icons.update),
        title: Text(suggestionList[index]),
        onTap: () {
          query = suggestionList[index];
        },
      ),
      itemCount: suggestionList.length,
    );
  }

  //Overrides the basic theme for the Searchdelegate
  @override
  ThemeData appBarTheme(BuildContext buildContext) {
    assert(buildContext != null);
    final ThemeData theme = Theme.of(buildContext);
    assert(theme != null);
    return ThemeData(
        primaryColor: Color(0xFF1DB954), brightness: Brightness.dark);
  }
}
