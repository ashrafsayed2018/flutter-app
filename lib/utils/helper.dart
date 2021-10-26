import 'package:forsale/application/classes/common/pagination.dart';
import 'package:forsale/utils/pagination_fetch_next.dart';

class Helper {
  static PaginationFetchNext? paginationFetchNext(Pagination? _pagination) {
    int _currentPage = 1;
    bool fetchNext = false;

    if (_pagination == null) {
      fetchNext = true;
    } else if (_pagination != null &&
        _pagination.currenPage! < _pagination.lastPage!.toInt()) {
      _currentPage = _pagination.currenPage! + 1;
      fetchNext = true;
    } else {
      fetchNext = false;
    }
    return PaginationFetchNext(currentPage: _currentPage, fetchNext: fetchNext);
  }
}
