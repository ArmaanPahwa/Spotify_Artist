import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SpotifyAuth {
  static Future<void> getAuthenticationToken() async {
    final clientId = env['CLIENT_ID'];
    final clientSecret = env['CLIENT_SECRET'];
    final base64Credential =
        utf8.fuse(base64).encode('$clientId:$clientSecret');

    final response = await http.post(
        Uri.parse('https://accounts.spotify.com/api/token'),
        body: {'grant_type': 'client_credentials'},
        headers: {'Authorization': 'Basic $base64Credential'});

    //Currently placeholder for how the token will be implemented
    if (response.statusCode == 200) {
      return "Success!";
    } else {
      return "Error: API Authentication Failed";
    }
  }
}
