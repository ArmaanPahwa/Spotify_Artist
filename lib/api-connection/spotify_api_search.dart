import 'dart:convert';

import 'package:spotify_artist/api-connection/authorization_token.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_artist/data-models/artist.dart';

class SpotifyApiSearch {
  static Future<List> getArtistSearchList(
      AuthorizationToken authorizationToken, String query) async {
    final String spotifyArtistUrl =
        'https://api.spotify.com/v1/search?q=$query&type=artist';
    final response = await http.get(Uri.parse(spotifyArtistUrl), headers: {
      'Authorization': 'Bearer ' + authorizationToken.getAccessToken()
    });

    var artistCollection = [];
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      var itemList = decodedJson['artists']['items'];
      for (Map item in itemList) {
        Artist artist = Artist.fromJson(item);
        artistCollection.add(artist);
      }
      return artistCollection;
    } else {
      throw new Exception("Error while searching...");
    }
  }
}
