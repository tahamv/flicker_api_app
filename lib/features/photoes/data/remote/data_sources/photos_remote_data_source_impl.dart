import 'package:flicker_api_app/core/base/data/base/model/base_response.dart';
import 'package:flicker_api_app/core/base/data/local/models/pagination/pagination_req_model.dart';
import 'package:flicker_api_app/features/photoes/data/remote/data_sources/photos_remote_data_source.dart';
import 'package:flicker_api_app/features/photoes/data/remote/models/photo_model.dart';
import 'package:flicker_api_app/features/photoes/data/remote/service/photos_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PhotosRemoteDataSource)
class PhotosRemoteDataSourceImpl extends PhotosRemoteDataSource {
  final PhotosService _service;

  PhotosRemoteDataSourceImpl(this._service);

  @override
  Future<BaseListResponseWithPages<PhotoModel?>> getPhotos(PaginationReqModel value) async {
    return await _service.getPhotos(value.page ?? 1, value.perPage ?? 25, "flickr.photos.search",
        "b8caa05174e445beb8046f63be142ab0", 'json', value.queryParams?['searchText'], 1);
  }
}
