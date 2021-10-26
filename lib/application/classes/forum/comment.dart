import 'package:forsale/application/classes/auth/user.dart';

class Comment {
  final String? comment;
  final User? createdBy;

  // create factory of comment class
  Comment.fromJson(Map<String, dynamic> jsonMap)
      : comment = jsonMap['comment'] ?? "",
        createdBy = User.fromJson(jsonMap['createdBy']);
}
