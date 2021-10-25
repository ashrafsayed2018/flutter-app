import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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

      if (networkError.response!.data is String) {
        throw Exception('not authorized');
      } else {
        Map<String, dynamic> validationErrors = networkError.response!.data;
        for (var err in validationErrors.values) {
          message = "\n$err";
        }
      }

      //loop through the validation errors

    } else {
      message += "somthing wrong is accured";
    }
  } else {
    message = "sorry you can't reach the server";
  }
  throw CommonError(message: message);
}
