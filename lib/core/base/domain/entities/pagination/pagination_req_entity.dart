class PaginationReqEntity {
  final int? page;
  final int? perPage;
  final Map<String, dynamic>? queryParams;

  PaginationReqEntity({
    this.page,
    this.perPage,
    this.queryParams,
  });
}
