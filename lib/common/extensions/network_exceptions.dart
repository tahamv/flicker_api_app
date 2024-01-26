import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest({String? message}) = UnauthorisedRequest;

  const factory NetworkExceptions.badRequest({String? message}) = BadRequest;

  const factory NetworkExceptions.notFound({String? message}) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess(String error, {StackTrace? stackTrace}) = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.forceUpdate({String? message}) = ForceUpdateError;

  const factory NetworkExceptions.unexpectedError({String? message}) = UnexpectedError;

  static NetworkExceptions getDioException(error, StackTrace? stackTrace) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          String? serverMessage = error.response?.data["message"];
          log(error.toString());
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioExceptionType.unknown:
              networkExceptions = const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  networkExceptions = NetworkExceptions.unauthorisedRequest(message: serverMessage);
                  break;
                case 401:
                  networkExceptions = NetworkExceptions.unauthorisedRequest(message: serverMessage);
                  break;
                case 403:
                  networkExceptions = NetworkExceptions.unauthorisedRequest(message: serverMessage);
                  break;
                case 404:
                  networkExceptions = NetworkExceptions.notFound(message: serverMessage);
                  break;
                case 409:
                  networkExceptions = const NetworkExceptions.conflict();
                  break;
                case 408:
                  networkExceptions = const NetworkExceptions.requestTimeout();
                  break;
                case 422:
                  networkExceptions = NetworkExceptions.unauthorisedRequest(message: serverMessage);
                  break;
                case 500:
                  networkExceptions = const NetworkExceptions.internalServerError();
                  break;
                case 503:
                  networkExceptions = const NetworkExceptions.serviceUnavailable();
                  break;
                case 426:
                  networkExceptions = NetworkExceptions.forceUpdate(message: serverMessage);
                  break;
                default:
                  var responseCode = error.response?.statusCode;
                  networkExceptions = NetworkExceptions.defaultError(
                    "Received invalid status code: $responseCode",
                  );
              }
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions = const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.connectionError:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        // Helper.printError(e.toString());
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      return NetworkExceptions.unableToProcess(error.toString(), stackTrace: stackTrace);
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String? message) {
      errorMessage = message ?? "Not Found";
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: (String? message) {
      errorMessage = message ?? "Bad request";
    }, unauthorisedRequest: (String? message) {
      errorMessage = message ?? "Unauthorised request";
    }, unexpectedError: (String? message) {
      errorMessage = message ?? "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: (e, stacktrace) {
      log(stacktrace.toString());
      errorMessage = "Unable to process the data\n ${stacktrace.toString()}";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    }, forceUpdate: (message) {
      errorMessage = message ?? 'Need Force App Update';
    });
    return errorMessage;
  }
}
