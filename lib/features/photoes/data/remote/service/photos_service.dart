import 'package:dio/dio.dart';
import 'package:flicker_api_app/core/base/data/base/model/base_response.dart';
import 'package:flicker_api_app/features/photoes/data/remote/models/photo_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'photos_service.g.dart';

@RestApi()
@lazySingleton
abstract class PhotosService {
  @factoryMethod
  factory PhotosService(Dio dio) = _PhotosService;

  @GET('')
  Future<BaseListResponseWithPages<PhotoModel?>> getPhotos(
      @Query('page') int page,
      @Query('per_page') int perPage,
      @Query('method') String method,
      @Query('api_key') String apiKey,
      @Query('format') String format,
      @Query('text') String text,
      @Query('nojsoncallback') int noJsonCallback);
}
