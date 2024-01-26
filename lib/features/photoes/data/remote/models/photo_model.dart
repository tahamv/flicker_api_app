class PhotoModel {
  final String? id;
  final String? title;
  final String? owner;
  String? secret;
  String? server;
  int? farm;

  PhotoModel({this.id, this.title, this.owner, this.secret, this.farm, this.server});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      owner: json['owner'] as String?,
      server: json['server'] as String?,
      secret: json['secret'] as String?,
      farm: json['farm'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['owner'] = owner;
    map['secret'] = secret;
    map['server'] = server;
    map['farm'] = farm;
    return map;
  }
}
