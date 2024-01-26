import 'package:flicker_api_app/common/extensions/network_exceptions.dart';
import 'package:flicker_api_app/core/base/data/base/model/base_response.dart';
import 'package:flicker_api_app/core/services/network/network_state/api_result.dart';

extension ErrorApiResultExtension on Object {
  ApiResult<T> toApiResult<T>(
    StackTrace? stackTrace,
  ) {
    final error = NetworkExceptions.getDioException(this, stackTrace);
    final str = NetworkExceptions.getErrorMessage(error);
    return ApiResult.failure(message: str, status: false);
  }
}

extension SuccessApiResultExtension on BaseSingleResponse {
  ApiResult<T> toApiResult<T>() {
    var apiResult = ApiResult<T>.success(data: data, message: message, status: status);
    return apiResult;
  }
}
