class NameModel {
  final String common;
  final String official;

  NameModel({required this.common, required this.official});

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
        common: json["common"],
        official: json["official"]
    );
  }
}