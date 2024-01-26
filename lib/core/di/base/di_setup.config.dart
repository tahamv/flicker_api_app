// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart' as _i4;

import '../../../features/photoes/data/remote/data_sources/photos_remote_data_source.dart' as _i8;
import '../../../features/photoes/data/remote/data_sources/photos_remote_data_source_impl.dart' as _i9;
import '../../../features/photoes/data/remote/service/photos_service.dart' as _i5;
import '../../../features/photoes/data/repositories/photo_repository_impl.dart' as _i11;
import '../../../features/photoes/domain/repositories/photo_repository.dart' as _i10;
import '../../../features/photoes/domain/use_cases/get_photos_list_usecase.dart' as _i12;
import '../../../features/photoes/presentation/manager/photos_cubit.dart' as _i13;
import '../../services/language_theme/language_theme_cubit.dart' as _i7;
import '../../services/network/interceptors/pretty_dio_logger.dart' as _i6;
import '../network/di/network_module.dart' as _i14;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.Dio>(networkModule.dio);
  gh.lazySingleton<_i4.InternetConnectionChecker>(() => networkModule.internetConnectionChecker);
  gh.lazySingleton<_i5.PhotosService>(() => _i5.PhotosService(gh<_i3.Dio>()));
  gh.singleton<_i6.PrettyDioLogger>(networkModule.prettyDioLogger);
  gh.factory<_i7.ThemeAndLanguageCubit>(() => _i7.ThemeAndLanguageCubit());
  gh.lazySingleton<_i8.PhotosRemoteDataSource>(() => _i9.PhotosRemoteDataSourceImpl(gh<_i5.PhotosService>()));
  gh.lazySingleton<_i10.PhotoRepository>(() => _i11.PhotoRepositoryImpl(gh<_i8.PhotosRemoteDataSource>()));
  gh.lazySingleton<_i12.GetPhotosListUseCase>(() => _i12.GetPhotosListUseCase(gh<_i10.PhotoRepository>()));
  gh.factory<_i13.PhotosCubit>(() => _i13.PhotosCubit(gh<_i12.GetPhotosListUseCase>()));
  return getIt;
}

class _$NetworkModule extends _i14.NetworkModule {}
