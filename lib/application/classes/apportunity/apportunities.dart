import 'package:flutter/foundation.dart';
import 'package:forsale/application/classes/apportunity/apportunity.dart';
import 'package:forsale/application/classes/common/pagination.dart';

class Apportunities {
  final Pagination? pagination;
  final List<Apportunity>? apportunities;

  Apportunities({
    @required this.pagination,
    @required this.apportunities,
  });
}
