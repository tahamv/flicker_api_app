// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiResult<T> {
  T? get data => throw _privateConstructorUsedError;

  String? get message => throw _privateConstructorUsedError;

  bool? get status => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data, String? message, bool? status) success,
    required TResult Function(T? data, String? message, bool? status, Pagination? pagination) successWithPages,
    required TResult Function(String? message, bool? status, T? data) failure,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data, String? message, bool? status)? success,
    TResult? Function(T? data, String? message, bool? status, Pagination? pagination)? successWithPages,
    TResult? Function(String? message, bool? status, T? data)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data, String? message, bool? status)? success,
    TResult Function(T? data, String? message, bool? status, Pagination? pagination)? successWithPages,
    TResult Function(String? message, bool? status, T? data)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Failure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Failure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiResultCopyWith<T, ApiResult<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResultCopyWith<T, $Res> {
  factory $ApiResultCopyWith(ApiResult<T> value, $Res Function(ApiResult<T>) then) =
      _$ApiResultCopyWithImpl<T, $Res, ApiResult<T>>;
  @useResult
  $Res call({T? data, String? message, bool? status});
}

/// @nodoc
class _$ApiResultCopyWithImpl<T, $Res, $Val extends ApiResult<T>> implements $ApiResultCopyWith<T, $Res> {
  _$ApiResultCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> implements $ApiResultCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(_$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data, String? message, bool? status});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res> extends _$ApiResultCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(_$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? status = freezed,
  }) {
    return _then(_$SuccessImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  const _$SuccessImpl({this.data, this.message, this.status});

  @override
  final T? data;
  @override
  final String? message;
  @override
  final bool? status;

  @override
  String toString() {
    return 'ApiResult<$T>.success(data: $data, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(data), message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data, String? message, bool? status) success,
    required TResult Function(T? data, String? message, bool? status, Pagination? pagination) successWithPages,
    required TResult Function(String? message, bool? status, T? data) failure,
  }) {
    return success(data, message, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data, String? message, bool? status)? success,
    TResult? Function(T? data, String? message, bool? status, Pagination? pagination)? successWithPages,
    TResult? Function(String? message, bool? status, T? data)? failure,
  }) {
    return success?.call(data, message, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data, String? message, bool? status)? success,
    TResult Function(T? data, String? message, bool? status, Pagination? pagination)? successWithPages,
    TResult Function(String? message, bool? status, T? data)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, message, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Failure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements ApiResult<T> {
  const factory Success({final T? data, final String? message, final bool? status}) = _$SuccessImpl<T>;

  @override
  T? get data;
  @override
  String? get message;
  @override
  bool? get status;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessWithPagesImplCopyWith<T, $Res> implements $ApiResultCopyWith<T, $Res> {
  factory _$$SuccessWithPagesImplCopyWith(
          _$SuccessWithPagesImpl<T> value, $Res Function(_$SuccessWithPagesImpl<T>) then) =
      __$$SuccessWithPagesImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data, String? message, bool? status, Pagination? pagination});
}

/// @nodoc
class __$$SuccessWithPagesImplCopyWithImpl<T, $Res> extends _$ApiResultCopyWithImpl<T, $Res, _$SuccessWithPagesImpl<T>>
    implements _$$SuccessWithPagesImplCopyWith<T, $Res> {
  __$$SuccessWithPagesImplCopyWithImpl(_$SuccessWithPagesImpl<T> _value, $Res Function(_$SuccessWithPagesImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_$SuccessWithPagesImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
    ));
  }
}

/// @nodoc

class _$SuccessWithPagesImpl<T> implements SuccessWithPages<T> {
  const _$SuccessWithPagesImpl({this.data, this.message, this.status, this.pagination});

  @override
  final T? data;
  @override
  final String? message;
  @override
  final bool? status;
  @override
  final Pagination? pagination;

  @override
  String toString() {
    return 'ApiResult<$T>.successWithPages(data: $data, message: $message, status: $status, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessWithPagesImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pagination, pagination) || other.pagination == pagination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(data), message, status, pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessWithPagesImplCopyWith<T, _$SuccessWithPagesImpl<T>> get copyWith =>
      __$$SuccessWithPagesImplCopyWithImpl<T, _$SuccessWithPagesImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data, String? message, bool? status) success,
    required TResult Function(T? data, String? message, bool? status, Pagination? pagination) successWithPages,
    required TResult Function(String? message, bool? status, T? data) failure,
  }) {
    return successWithPages(data, message, status, pagination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data, String? message, bool? status)? success,
    TResult? Function(T? data, String? message, bool? status, Pagination? pagination)? successWithPages,
    TResult? Function(String? message, bool? status, T? data)? failure,
  }) {
    return successWithPages?.call(data, message, status, pagination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data, String? message, bool? status)? success,
    TResult Function(T? data, String? message, bool? status, Pagination? pagination)? successWithPages,
    TResult Function(String? message, bool? status, T? data)? failure,
    required TResult orElse(),
  }) {
    if (successWithPages != null) {
      return successWithPages(data, message, status, pagination);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Failure<T> value) failure,
  }) {
    return successWithPages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return successWithPages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (successWithPages != null) {
      return successWithPages(this);
    }
    return orElse();
  }
}

abstract class SuccessWithPages<T> implements ApiResult<T> {
  const factory SuccessWithPages(
      {final T? data,
      final String? message,
      final bool? status,
      final Pagination? pagination}) = _$SuccessWithPagesImpl<T>;

  @override
  T? get data;
  @override
  String? get message;
  @override
  bool? get status;
  Pagination? get pagination;
  @override
  @JsonKey(ignore: true)
  _$$SuccessWithPagesImplCopyWith<T, _$SuccessWithPagesImpl<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<T, $Res> implements $ApiResultCopyWith<T, $Res> {
  factory _$$FailureImplCopyWith(_$FailureImpl<T> value, $Res Function(_$FailureImpl<T>) then) =
      __$$FailureImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String? message, bool? status, T? data});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<T, $Res> extends _$ApiResultCopyWithImpl<T, $Res, _$FailureImpl<T>>
    implements _$$FailureImplCopyWith<T, $Res> {
  __$$FailureImplCopyWithImpl(_$FailureImpl<T> _value, $Res Function(_$FailureImpl<T>) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? status = freezed,
    Object? data = freezed,
  }) {
    return _then(_$FailureImpl<T>(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$FailureImpl<T> implements Failure<T> {
  const _$FailureImpl({this.message, this.status, this.data});

  @override
  final String? message;
  @override
  final bool? status;
  @override
  final T? data;

  @override
  String toString() {
    return 'ApiResult<$T>.failure(message: $message, status: $status, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, status, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      __$$FailureImplCopyWithImpl<T, _$FailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data, String? message, bool? status) success,
    required TResult Function(T? data, String? message, bool? status, Pagination? pagination) successWithPages,
    required TResult Function(String? message, bool? status, T? data) failure,
  }) {
    return failure(message, status, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data, String? message, bool? status)? success,
    TResult? Function(T? data, String? message, bool? status, Pagination? pagination)? successWithPages,
    TResult? Function(String? message, bool? status, T? data)? failure,
  }) {
    return failure?.call(message, status, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data, String? message, bool? status)? success,
    TResult Function(T? data, String? message, bool? status, Pagination? pagination)? successWithPages,
    TResult Function(String? message, bool? status, T? data)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message, status, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T> value) success,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Failure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T> value)? success,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T> value)? success,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T> implements ApiResult<T> {
  const factory Failure({final String? message, final bool? status, final T? data}) = _$FailureImpl<T>;

  @override
  String? get message;
  @override
  bool? get status;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith => throw _privateConstructorUsedError;
}
