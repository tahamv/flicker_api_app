import 'package:freezed_annotation/freezed_annotation.dart';

part 'infinite_list_pagination_state_generic.freezed.dart';

@freezed
class InfiniteListPaginationStateGeneric<T> with _$InfiniteListPaginationStateGeneric<T> {
  const factory InfiniteListPaginationStateGeneric.idle() = InfiniteListPaginationStateGenericIdle<T>;

  const factory InfiniteListPaginationStateGeneric.loading() = InfiniteListPaginationStateGenericLoading<T>;

  const factory InfiniteListPaginationStateGeneric.success(List<T> items) =
      InfiniteListPaginationStateGenericSuccess<T>;

  const factory InfiniteListPaginationStateGeneric.empty() = InfiniteListPaginationStateGenericEmpty<T>;

  const factory InfiniteListPaginationStateGeneric.failure(String? message) =
      InfiniteListPaginationStateGenericFailure<T>;

  const factory InfiniteListPaginationStateGeneric.paginationLoading(List<T> items) =
      InfiniteListPaginationStateGenericPaginationLoading<T>;

  const factory InfiniteListPaginationStateGeneric.paginationFailure(String? message, List<T> items) =
      InfiniteListPaginationStateGenericPaginationFailure<T>;

  const factory InfiniteListPaginationStateGeneric.refreshLoading(List<T> items) =
      InfiniteListPaginationStateGenericRefreshLoading<T>;
}
