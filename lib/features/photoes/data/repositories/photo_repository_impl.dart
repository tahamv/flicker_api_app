import 'package:flicker_api_app/common/extensions/api_result_extension.dart';
import 'package:flicker_api_app/core/base/domain/entities/pagination/pagination_req_entity.dart';
import 'package:flicker_api_app/core/base/domain/entities/pagination/pagination_req_mapper.dart';
import 'package:flicker_api_app/core/services/network/network_state/api_result.dart';
import 'package:flicker_api_app/features/photoes/data/remote/data_sources/photos_remote_data_source.dart';
import 'package:flicker_api_app/features/photoes/domain/entities/photo_entity.dart';
import 'package:flicker_api_app/features/photoes/domain/entities/photo_mapper.dart';
import 'package:flicker_api_app/features/photoes/domain/repositories/photo_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PhotoRepository)
class PhotoRepositoryImpl extends PhotoRepository {
  final PhotosRemoteDataSource _favoriteRemoteDataSource;

  PhotoRepositoryImpl(this._favoriteRemoteDataSource);

  @override
  Future<ApiResult<List<PhotoEntity?>?>> getPhotos(PaginationReqEntity value) async {
    try {
      final result = await _favoriteRemoteDataSource.getPhotos(value.mapper());
      return ApiResult<List<PhotoEntity?>?>.successWithPages(
        data: result.data?.map((e) => e?.mapper()).toList(),
        message: result.message,
        status: result.status,
        pagination: result.pagination,
      );
    } catch (e, s) {
      return e.toApiResult(s);
    }
  }
}
