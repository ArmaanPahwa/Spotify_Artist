import 'dart:convert';

import 'package:spotify_artist/api-connection/authorization_token.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_artist/data-models/artist.dart';

class SpotifyApiSearch {
  static Future<Artist> getArtistSearch(
      AuthorizationToken authorizationToken, String query) async {
    final String spotifyArtistUrl =
        'https://api.spotify.com/v1/search?q=$query&type=artist';
    final response = await http.get(Uri.parse(spotifyArtistUrl), headers: {
      'Authorization': 'Bearer ' + authorizationToken.getAccessToken()
    });

    if (response.statusCode == 200) {
      //Implement Artist class
      //var decodedResponse = json.decode(response.body);
      return Artist.fromJson(json.decode(response.body));
    } else {
      throw new Exception("Error while searching...");
    }
  }
}
