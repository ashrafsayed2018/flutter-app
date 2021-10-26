class ApportunityDetail {
  final String? benefits,
      applicationProcess,
      furtherQueries,
      eligibilities,
      startDate,
      endDate,
      officialLinks,
      eligibleRegions;
  // create factory of ApportunityDetail class
  ApportunityDetail.fromJson(Map<String, dynamic> jsonMap)
      : benefits = jsonMap['benefits'] ?? "",
        applicationProcess = jsonMap['applicationProcess'] ?? "",
        furtherQueries = jsonMap['furtherQueries'] ?? "",
        eligibilities = jsonMap['eligibilities'] ?? "",
        startDate = jsonMap['startDate'] ?? "",
        endDate = jsonMap['endDate'] ?? "",
        officialLinks = jsonMap['officialLinks'] ?? "",
        eligibleRegions = jsonMap['eligibleRegions'] ?? "";
}
