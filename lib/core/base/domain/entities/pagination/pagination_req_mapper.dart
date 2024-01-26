import 'package:flicker_api_app/core/base/data/local/models/pagination/pagination_req_model.dart';
import 'package:flicker_api_app/core/base/domain/entities/pagination/pagination_req_entity.dart';

extension MapperOnPaginationReqModel on PaginationReqModel {
  PaginationReqEntity mapper() {
    return PaginationReqEntity(
      page: page,
      perPage: perPage,
      queryParams: queryParams,
    );
  }
}

extension MapperOnPaginationReqEntity on PaginationReqEntity {
  PaginationReqModel mapper() {
    return PaginationReqModel(
      page: page,
      perPage: perPage,
      queryParams: queryParams,
    );
  }
}
