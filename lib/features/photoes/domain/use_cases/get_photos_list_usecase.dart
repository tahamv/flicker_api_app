import 'package:flicker_api_app/core/base/domain/entities/pagination/pagination_req_entity.dart';
import 'package:flicker_api_app/core/base/domain/use_case/base_usecase.dart';
import 'package:flicker_api_app/core/services/network/network_state/api_result.dart';
import 'package:flicker_api_app/features/photoes/domain/entities/photo_entity.dart';
import 'package:flicker_api_app/features/photoes/domain/repositories/photo_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPhotosListUseCase extends BaseUseCase<ApiResult<List<PhotoEntity?>?>, PaginationReqEntity> {
  GetPhotosListUseCase(
    this._repository,
  );

  final PhotoRepository _repository;

  @override
  Future<ApiResult<List<PhotoEntity?>?>> call(PaginationReqEntity arg) async {
    ApiResult<List<PhotoEntity?>?> result = await _repository.getPhotos(arg);
    return result;
  }
}
