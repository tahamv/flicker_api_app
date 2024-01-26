import 'dart:collection';

import 'package:flicker_api_app/core/base/domain/entities/pagination/pagination_req_entity.dart';
import 'package:flicker_api_app/core/services/network/network_state/api_result.dart';
import 'package:flicker_api_app/core/ui_kit/infinite_lists/bloc/infinite_list_pagination_state.dart';
import 'package:flicker_api_app/features/photoes/domain/entities/photo_entity.dart';
import 'package:flicker_api_app/features/photoes/domain/use_cases/get_photos_list_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PhotosCubit extends Cubit<InfiniteListPaginationState> {
  final GetPhotosListUseCase _getFavoriteListUseCase;

  PhotosCubit(this._getFavoriteListUseCase) : super(const InfiniteListPaginationState.idle());

  int _currentPage = 1;
  int? _lastPage = 1;
  Map<String, String>? queryParam;

  List<PhotoEntity> _teams = [];

  void resetPagination() {
    _currentPage = 1;
    _lastPage = 1;
    queryParam = null;
    _teams = [];
  }

  Future<void> refresh({String? text}) async {
    _currentPage = 1;
    _lastPage = 1;
    await getPhotos(isRefresh: true,searchText: text);
  }

  Future<void> getPhotos({isRefresh = false, searchText = ""}) async {
    queryParam = {"searchText": searchText};
    if (_currentPage <= _lastPage!) {
      if (isRefresh) {
        emit(InfiniteListPaginationState.refreshLoading(_teams));
      } else {
        emit(InfiniteListPaginationState.loading(_teams));
      }
      print('h');

      ApiResult<List<PhotoEntity?>?> result = await _getFavoriteListUseCase
          .call(PaginationReqEntity(page: _currentPage, perPage: 25, queryParams: queryParam));
      result.whenOrNull(
        successWithPages: (data, msg, status, pagination) {
          if (status ?? false) {
            _currentPage = (pagination?.currentPage ?? 1) + 1;
            _lastPage = pagination?.lastPage ?? 1;
            if (isRefresh) {
              _teams.clear();
            }
            if (data != null) {
              for (var element in data) {
                if (element != null) {
                  _teams.add(element);
                }
              }
            }
            _teams = LinkedHashSet<PhotoEntity>.from(_teams).toList();
            emit(InfiniteListPaginationState.success(_teams));
          } else {
            emit(InfiniteListPaginationState.error(msg: msg ?? '', data: _teams));
          }
        },
        failure: (msg, status, data) {
          emit(InfiniteListPaginationState.error(
            msg: msg,
            data: _teams,
          ));
        },
      );
    }
  }
}
