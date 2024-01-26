import 'package:freezed_annotation/freezed_annotation.dart';

part 'infinite_list_pagination_state.freezed.dart';

@freezed
class InfiniteListPaginationState with _$InfiniteListPaginationState {
  const factory InfiniteListPaginationState.idle() = InfiniteListPaginationStateIdle;

  const factory InfiniteListPaginationState.loading(data) = InfiniteListPaginationStateLoading;

  const factory InfiniteListPaginationState.refreshLoading(data) = InfiniteListPaginationStateRefreshLoading;

  const factory InfiniteListPaginationState.itemLoading() = InfiniteListPaginationStateItemLoading;

  const factory InfiniteListPaginationState.success(data) = InfiniteListPaginationStateSuccess;

  const factory InfiniteListPaginationState.successItem(data) = InfiniteListPaginationStateItemSuccess;

  const factory InfiniteListPaginationState.error({msg, data}) = InfiniteListPaginationStateError;
}
