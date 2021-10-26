import 'package:forsale/application/classes/apportunity/apportunities.dart';
import 'package:forsale/application/classes/apportunity/apportunity.dart';
import 'package:forsale/application/classes/common/pagination.dart';
import 'package:forsale/application/repositories/apportunity_repository.dart';

class ApportunityState {
  final ApportunityRepository? _apportunityRepository;

  List<Apportunity>? _apportunities = [];

  ApportunityState(this._apportunityRepository);
  List<Apportunity> get apportunities => _apportunities!;

  Pagination? _pagination;

  // Creating a field
  bool? _loading;

  // Using the getter
  // method to take input
  bool get loading => _loading!;

  Future getAllApportunities() async {
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
      Apportunities? _newApportunities =
          await _apportunityRepository!.getAllApportunities(_currentPage);

      _apportunities!.addAll(_newApportunities.apportunities!.toList());
      _pagination = _newApportunities.pagination;
      _loading = false;
    }
  }
}
