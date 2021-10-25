class Category {
  final int? id;
  final String? name;

// instantiate the class with factory
  Category.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] ?? 0,
        name = jsonMap['name'] ?? "";
}
