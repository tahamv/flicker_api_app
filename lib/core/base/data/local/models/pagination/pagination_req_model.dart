class PaginationReqModel {
  final int? page;
  final int? perPage;
  final Map<String, dynamic>? queryParams;

  PaginationReqModel({
    this.page,
    this.perPage,
    this.queryParams,
  });
}
