import 'package:flicker_api_app/core/base/data/local/models/pagination/pagination_res_model.dart';

import 'pagination_res_entity.dart';

extension MapperOnPaginationResModel on PaginationResModel {
  PaginationResEntity? mapper() {
    return PaginationResEntity(
      currentPage: currentPage,
      lastPage: lastPage,
      perPage: perPage,
      total: total,
    );
  }
}

extension MapperOnPaginationResEntity on PaginationResEntity {
  PaginationResModel? mapper() {
    return PaginationResModel(
      currentPage: currentPage,
      lastPage: lastPage,
      perPage: perPage,
      total: total,
    );
  }
}
