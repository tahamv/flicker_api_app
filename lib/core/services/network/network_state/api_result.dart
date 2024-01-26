import 'package:flicker_api_app/core/base/data/base/model/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@freezed
// @Welltested()
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({T? data, String? message, bool? status}) = Success<T>;

  const factory ApiResult.successWithPages({
    T? data,
    String? message,
    bool? status,
    Pagination? pagination,
  }) = SuccessWithPages<T>;

  const factory ApiResult.failure({
    String? message,
    bool? status,
    T? data,
  }) = Failure<T>;
}
