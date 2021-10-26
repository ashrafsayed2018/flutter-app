import 'package:dio/dio.dart';
import 'package:forsale/application/classes/common/pagination.dart';
import 'package:forsale/application/classes/errors/common_error.dart';
import 'package:forsale/application/classes/forum/question.dart';
import 'package:forsale/application/classes/forum/questions.dart';
import 'package:forsale/application/forsale_api.dart';
import 'package:forsale/application/storage/localstorage.dart';
import 'package:forsale/application/storage/storage_keys.dart';

abstract class ForumRepository {
  // fetsh the questions from the server

  Future<Questions> getAllQuestions(int? page);
}

class ForumRepositoryImpl implements ForumRepository {
  @override
  Future<Questions> getAllQuestions(int? page) async {
    try {
      final response = await ForsaleApi.dio.get(
        "api/questions?page=$page",
        options: Options(
          headers: {'Authorization': "Bearer ${LocalStorage.getItem(token)}"},
        ),
      );

      List _data = response.data['data'];
      // the meta for pagination the pages and the current and last page

      var _meta = response.data['meta'];
      Pagination pagination = Pagination.fromJson(_meta);

      List<Question> _questions =
          _data.map((question) => Question.fromJson(question)).toList();
      return Questions(pagination: pagination, questions: _questions);
    } on DioError catch (error) {
      throw showNetworkErrors(error);
    }
  }
}
