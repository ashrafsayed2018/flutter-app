import 'package:forsale/application/classes/apportunity/apportinityDetail.dart';
import 'package:forsale/application/classes/auth/user.dart';
import 'package:forsale/application/classes/common/category.dart';
import 'package:forsale/application/classes/common/country.dart';

class Apportunity {
  final int? id;
  final String? title, deadline, organizer, createdAt, updatedAt;
  final Category? category;
  final Country? country;
  final User? createdBy;
  final ApportunityDetail? apportunityDetail;

  Apportunity.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        title = jsonMap['title'] ?? "",
        deadline = jsonMap['deadline'] ?? "",
        organizer = jsonMap['organizer'] ?? "",
        createdAt = jsonMap['createdAt'] ?? "",
        updatedAt = jsonMap['updatedAt'] ?? "",
        category = jsonMap['category'] != null
            ? Category.fromJson(jsonMap['category'])
            : null,
        country = jsonMap['country'] != null
            ? Country.fromJson(jsonMap['country'])
            : null,
        createdBy = jsonMap['createdBy'] != null
            ? User.fromJson(jsonMap['createdBy'])
            : null,
        apportunityDetail = jsonMap['apportunityDetail'] != null
            ? ApportunityDetail.fromJson(jsonMap['apportunityDetail'])
            : null;
}
