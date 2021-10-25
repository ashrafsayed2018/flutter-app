class User {
  final int? id;
  final String firstName,
      lastName,
      email,
      password,
      bio,
      profilePicture,
      joinedOn;

  User.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        firstName = jsonMap['firstName'] ?? "",
        lastName = jsonMap['lastName'] ?? "",
        email = jsonMap['email'] ?? "",
        password = jsonMap['password'] ?? "",
        bio = jsonMap['bio'] ?? "",
        profilePicture = jsonMap['profilePicture'] ?? "",
        joinedOn = jsonMap['joinedOn'] ?? "";
}
