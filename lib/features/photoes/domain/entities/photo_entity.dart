// import 'package:annotations/generate_model_annotations.dart';
// @GenerateModelClass(className:'PropertySearchResModel')
// @GenerateMapper(model: true,entity: true)
class PhotoEntity {
  String? id;
  String? title;
  String? owner;
  String? secret;
  String? server;
  int? farm;

  PhotoEntity({this.id, this.title, this.owner, this.secret, this.farm, this.server});
}
