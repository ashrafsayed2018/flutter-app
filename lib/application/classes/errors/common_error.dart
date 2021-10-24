import 'package:dio/dio.dart';

class CommonError extends Error {
  final String? message;

  CommonError({this.message});
}

showNetworkErrors(DioError networkError) {
  String message = "";

  if (networkError.response != null) {
    // if status  code = 401 authantication error

    if (networkError.response!.statusCode == 401) {
      message = "sorry you entered worong credentials";
    } else if (networkError.response!.statusCode == 422) {
      // unproccessable entity

      Map<String, dynamic> validationErrors = networkError.response!.data;

      //loop through the validation errors

      for (var err in validationErrors.values) {
        message = "\n$err";
      }
    } else {
      message += "somthing wrong is accured";
    }
  } else {
    message = "sorry you can't reach the server";
  }
  throw CommonError(message: message);
}
