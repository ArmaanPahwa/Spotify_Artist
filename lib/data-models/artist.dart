class Artist {
  String name;
  int followers;
  String imageUrl;
  int popularity;

  Artist(this.name, this.followers, this.imageUrl, this.popularity);

  factory Artist.fromJson(Map json) {
    String url = json['images'].isEmpty
        ? 'https://i.postimg.cc/g0S6djR1/default-user.jpg'
        : json['images'][0]['url'];
    return Artist(
        json['name'], json['followers']['total'], url, json['popularity']);
  }

  String getArtistName() {
    return this.name;
  }

  int getArtistFollowers() {
    return this.followers;
  }

  String getArtistImageUrl() {
    return this.imageUrl;
  }
}
