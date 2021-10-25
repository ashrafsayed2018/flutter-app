import 'package:dio/dio.dart';
import 'package:forsale/application/classes/apportunity/apportunity.dart';
import 'package:forsale/application/classes/errors/common_error.dart';
import 'package:forsale/application/forsale_api.dart';
import 'package:forsale/application/storage/localstorage.dart';
import 'package:forsale/application/storage/storage_keys.dart';

abstract class ApportunityRepository {
  // fetch the list of  apportunities

  Future<List<Apportunity>> getAllApportunities();
}

class ApportunityRepositoryImpl implements ApportunityRepository {
  @override
  Future<List<Apportunity>> getAllApportunities() async {
    try {
      final response = await ForsaleApi.dio.get("api/apportunity",
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(token)}"
          }));

      List _temp = response.data['data'];
      List<Apportunity> _apportunities = _temp
          .map((apportuinity) => Apportunity.fromJson(apportuinity))
          .toList();
      return _apportunities;
    } on DioError catch (error) {
      throw showNetworkErrors(error);
    }
  }
}
