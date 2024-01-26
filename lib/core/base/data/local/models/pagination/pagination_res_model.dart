class PaginationResModel {
  final int? currentPage;
  final int? lastPage;
  final int? perPage;
  final int? total;

  PaginationResModel({
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  });

  factory PaginationResModel.fromJson(Map<String, dynamic> json) {
    return PaginationResModel(
      currentPage: json['currentPage'] as int?,
      lastPage: json['lastPage'] as int?,
      perPage: json['perPage'] as int?,
      total: json['total'] as int?,
    );
  }
}
