import 'package:flicker_api_app/core/base/data/base/model/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.g.dart';

class BaseResponse {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;

  BaseResponse({this.status, this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      status: json["status"],
      message: json["message"],
    );
  }
}

@JsonSerializable(genericArgumentFactories: true)
class BaseListResponse<T> extends BaseResponse {
  List<T>? data;

  BaseListResponse({
    super.message,
    super.status,
    this.data,
  });

  factory BaseListResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    var data = <T>[];
    json['data'].forEach((v) {
      data.add(create(v));
    });

    return BaseListResponse<T>(status: json["status"], message: json["message"], data: data);
  }
}

@JsonSerializable(genericArgumentFactories: true)
class BaseSingleResponse<T> extends BaseResponse {
  T? data;

  BaseSingleResponse({
    super.message,
    super.status,
    this.data,
  });

  factory BaseSingleResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return BaseSingleResponse<T>(
        status: json["status"], message: json["message"], data: json['data'] != null ? create(json['data']) : null);
  }
}

@JsonSerializable(genericArgumentFactories: true)
class BaseListResponseWithPages<T> extends BaseListResponse<T> {
  Pagination? pagination;

  BaseListResponseWithPages({
    this.pagination,
    super.message,
    super.status,
    super.data,
  });

  factory BaseListResponseWithPages.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    var data = <T>[];
    if (json['stat'] == "ok") {
      json['photos']['photo'].forEach((v) {
        data.add(create(v));
      });
      return BaseListResponseWithPages<T>(
          status: json['stat'] == "ok",
          message: "",
          data: data,
          pagination: Pagination(
            currentPage: json['photos']['page'],
            lastPage: json['photos']['pages'],
            perPage: json['photos']['perpage'],
            total: json['photos']['total'],
          ));
    } else {
      return BaseListResponseWithPages<T>(
          status: false, message: json["message"], data: data, pagination: Pagination());
    }
  }
}
