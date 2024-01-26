class TokenModel {
  TokenModel({this.accessToken, this.refreshToken});

  String? accessToken;
  String? refreshToken;

  factory TokenModel.fromJson(Map<String, dynamic>? map) {
    return TokenModel(
      accessToken: map?['accessToken'] as String?,
      refreshToken: map?['refreshToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    return map;
  }
}
