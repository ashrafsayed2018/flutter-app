import 'package:dio/dio.dart';
import 'package:forsale/application/classes/apportunity/apportunities.dart';
import 'package:forsale/application/classes/apportunity/apportunity.dart';
import 'package:forsale/application/classes/common/pagination.dart';
import 'package:forsale/application/classes/errors/common_error.dart';
import 'package:forsale/application/forsale_api.dart';
import 'package:forsale/application/storage/localstorage.dart';
import 'package:forsale/application/storage/storage_keys.dart';

abstract class ApportunityRepository {
  // fetch the list of  apportunities

  Future<Apportunities> getAllApportunities(int? page);
}

class ApportunityRepositoryImpl implements ApportunityRepository {
  @override
  Future<Apportunities> getAllApportunities(int? page) async {
    try {
      final response = await ForsaleApi.dio.get("api/apportunity?page=$page",
          options: Options(headers: {
            'Authorization': "Bearer ${LocalStorage.getItem(token)}"
          }));

      List _temp = response.data['data'];
      // the meta for pagination the pages and the current and last page

      var _meta = response.data['meta'];
      Pagination pagination = Pagination.fromJson(_meta);

      List<Apportunity> _apportunities = _temp
          .map((apportuinity) => Apportunity.fromJson(apportuinity))
          .toList();
      return Apportunities(
          pagination: pagination, apportunities: _apportunities);
    } on DioError catch (error) {
      throw showNetworkErrors(error);
    }
  }
}
