class AuthorizationToken {
  String accessToken;
  String tokenType;

  AuthorizationToken(this.accessToken, this.tokenType);

  factory AuthorizationToken.fromJson(Map json) {
    return AuthorizationToken(json['access_token'], json['token_type']);
  }

  String getAccessToken() {
    return this.accessToken;
  }

  String getTokenType() {
    return this.tokenType;
  }
}
