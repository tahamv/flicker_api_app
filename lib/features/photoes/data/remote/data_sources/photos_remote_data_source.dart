import 'package:flicker_api_app/core/base/data/base/model/base_response.dart';
import 'package:flicker_api_app/core/base/data/local/models/pagination/pagination_req_model.dart';
import 'package:flicker_api_app/features/photoes/data/remote/models/photo_model.dart';

abstract class PhotosRemoteDataSource {
  Future<BaseListResponseWithPages<PhotoModel?>> getPhotos(PaginationReqModel value);
}
