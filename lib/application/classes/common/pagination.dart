class Pagination {
  final int? currenPage, lastPage, perPage;
  Pagination.fromJson(Map<String, dynamic> jsonMap)
      : currenPage = jsonMap['current_page'] ?? 1,
        lastPage = jsonMap['last_page'] ?? 0,
        perPage = jsonMap['per_page'] ?? 0;
}
