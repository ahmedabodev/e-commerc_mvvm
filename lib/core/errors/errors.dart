import 'package:dio/dio.dart';

abstract class Failure {
   String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  // factory ServerFailure.fromDioError(DioError dioError) {
  //   switch (dioError.type) {
  //     case DioErrorType.connectionTimeout:
  //       return ServerFailure('Connection timeout with ApiServer');
  //
  //     case DioErrorType.sendTimeout:
  //       return ServerFailure('Send timeout with ApiServer');
  //
  //     case DioErrorType.receiveTimeout:
  //       return ServerFailure('Receive timeout with ApiServer');
  //
  //
  //     case DioErrorType.cancel:
  //       return ServerFailure('Request to ApiServer was canceld');
  //
  //
  //     default:
  //       return ServerFailure('Opps There was an Error, Please try again');
  //   }
  // }

  factory ServerFailure.fromResponse( dynamic response) {
   if(response==['weak-password']){
      return ServerFailure('The password provided is too weak.');

    }else if(response==['email-already-in-use']){
      return ServerFailure('The account already exists for that email.');

    }
   else if(response==['invalid-email']){
      return ServerFailure('invalid-email');
    }   else if(response==['wrong-password']){
      return ServerFailure('wrong-password');
    }   else if(response==['user-not-found']){
      return ServerFailure('user-not-found');
    }

    else {
      return ServerFailure(response);
    }
  }
}