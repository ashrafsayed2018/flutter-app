import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:forsale/application/classes/errors/common_error.dart';
import 'package:forsale/application/forsale_api.dart';
import 'package:forsale/application/storage/localstorage.dart';
import 'package:forsale/application/storage/storage_keys.dart';

abstract class AuthRepository {
  Future signIn({
    @required String email,
    @required String password,
  });

  Future signUp({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required String passwordConfirmation,
  });
}

class AuthRepositoryImp implements AuthRepository {
  @override
  Future signIn({String? email, String? password}) async {
    try {
      var response = await ForsaleApi.dio.post('api/auth/login', data: {
        "email": email,
        "password": password,
      });

      // save the SharedPreferences after the user login to not login every time
      String accessToken = response.data['accessToken'];
      String expiresAt = response.data['expiresAt'];
      await LocalStorage.setIem(token, accessToken);
      await LocalStorage.setIem(token_exipration, expiresAt);

      return;
    } on DioError catch (error) {
      showNetworkErrors(error);
    }

    // post the data to the server
  }

  @override
  Future signUp({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? passwordConfirmation,
  }) async {
    try {
      var response = await ForsaleApi.dio.post('api/auth/register', data: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation
      });
      print(response);
    } on DioError catch (e) {
      print(e.response);
    }
  }
}
