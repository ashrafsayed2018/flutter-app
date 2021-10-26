import 'package:forsale/application/classes/common/pagination.dart';
import 'package:forsale/application/classes/forum/question.dart';
import 'package:forsale/application/classes/forum/questions.dart';
import 'package:forsale/application/repositories/forum_repository.dart';
import 'package:forsale/utils/helper.dart';

class ForumSate {
  final ForumRepository _forumRepository;

  ForumSate(this._forumRepository);

  List<Question> _questions = [];
  List<Question> get apportunities => _questions;

  Pagination? _pagination;

  bool? _loading;

  // Using the getter
  bool get loading => _loading!;

  Future getAllQuestions() async {
    int _currentPage = 1;
    bool fetchNext = false;

    if (_pagination == null) {
      fetchNext = true;
    } else if (_pagination != null &&
        _pagination!.currenPage! < _pagination!.lastPage!.toInt()) {
      _currentPage = _pagination!.currenPage! + 1;
      fetchNext = true;
    } else {
      fetchNext = false;
    }
    if (fetchNext) {
      _loading = true;
      Questions? _newQuestions =
          await _forumRepository.getAllQuestions(_currentPage);

      _questions.addAll(_newQuestions.questions!.toList());
      _pagination = _newQuestions.pagination;
      _loading = false;
    }
  }
}
