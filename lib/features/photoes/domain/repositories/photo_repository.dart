import 'package:flicker_api_app/core/base/domain/entities/pagination/pagination_req_entity.dart';
import 'package:flicker_api_app/core/services/network/network_state/api_result.dart';
import 'package:flicker_api_app/features/photoes/domain/entities/photo_entity.dart';

abstract class PhotoRepository {
  Future<ApiResult<List<PhotoEntity?>?>> getPhotos(PaginationReqEntity value);
}
