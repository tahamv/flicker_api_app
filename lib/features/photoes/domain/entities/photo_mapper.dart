import 'package:flicker_api_app/features/photoes/data/remote/models/photo_model.dart';
import 'package:flicker_api_app/features/photoes/domain/entities/photo_entity.dart';

extension MapperOnPropertySearchResModel on PhotoModel {
  PhotoEntity? mapper() {
    return PhotoEntity(id: id, title: title, owner: owner, secret: secret, server: server, farm: farm);
  }
}

extension MapperOnPropertySearchResEntity on PhotoEntity {
  PhotoModel? mapper() {
    return PhotoModel(id: id, title: title, owner: owner, secret: secret, server: server, farm: farm);
  }
}
