class Artist {
  String name;

  Artist(this.name);

  factory Artist.fromJson(Map json) {
    //Frame for artist factory. To be edited later.
    return Artist(json['artists']['items'][0]['name']);
  }

  String getArtistName() {
    return this.name;
  }
}
