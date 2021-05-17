import 'package:flutter/material.dart';

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
  var entries = [
    "Entry 1",
    "Entry 2",
    "Entry 3",
    "Entry 4",
    "Entry 5",
    "Artist 1",
    "Artist 2",
    "Artist 3",
  ];

  var suggestedEntries = [
    "Entry 1",
    "Entry 2",
    "Artist 1",
  ];

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
    final dataResults = entries.where(
      (entry) => entry.toLowerCase().contains(query.toLowerCase()),
    );

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.person_search),
        title: Text(dataResults.elementAt(index)),
        onTap: () {},
      ),
      itemCount: dataResults.length,
    );
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
