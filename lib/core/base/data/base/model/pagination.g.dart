// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: json['page'] as int?,
      lastPage: json['pages'] as int?,
      perPage: json['perpage'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) => <String, dynamic>{
      'page': instance.currentPage,
      'pages': instance.lastPage,
      'perpage': instance.perPage,
      'total': instance.total,
    };
