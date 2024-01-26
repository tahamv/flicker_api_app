import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {
  @JsonKey(name: 'page')
  int? currentPage;
  @JsonKey(name: 'pages')
  int? lastPage;
  @JsonKey(name: 'perpage')
  int? perPage;
  @JsonKey(name: 'total')
  int? total;

  Pagination({this.currentPage, this.lastPage, this.perPage, this.total});

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
