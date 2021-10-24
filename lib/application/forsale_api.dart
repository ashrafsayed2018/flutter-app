import 'package:dio/dio.dart';
import 'package:forsale/base_url.dart';

class ForsaleApi {
  static BaseOptions _baseOptions = BaseOptions(baseUrl: baseUrl!);

  // for unathanticated routes apis
  static Dio dio = Dio(_baseOptions);

  // for authanticated routes apis

  static Dio dioAuth() {
    return Dio();
  }
}
