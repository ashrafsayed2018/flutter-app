import 'package:forsale/application/classes/auth/user.dart';
import 'package:forsale/application/classes/forum/comment.dart';

class Question {
  final String? question;
  final User? createdBy;
  final List<Comment>? comments;

  static _getComments(List<dynamic> comments) {
    return comments
        .map(
          (comment) => Comment.fromJson(comment),
        )
        .toList();
  }

  // create factory of question class
  Question.fromJson(Map<String, dynamic> jsonMap)
      : question = jsonMap['question'] ?? "",
        createdBy = User.fromJson(jsonMap['createdBy']),
        comments = _getComments(jsonMap['comments']);
}
