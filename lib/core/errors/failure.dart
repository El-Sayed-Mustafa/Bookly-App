import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  // ignore: deprecated_member_use
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            'Connection timeout error in connection to server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout error in send to server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout error in receive to server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate error ');
      case DioExceptionType.badResponse:
        return ServerFailure('Bad response error');
      case DioExceptionType.cancel:
        return ServerFailure('Cancel error');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error');
      case DioExceptionType.unknown:
        return ServerFailure('unknown');
    }
  }
}
