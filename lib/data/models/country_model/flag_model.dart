class FlagModel {
  final String png;
  final String svg;
  final String? alt;

  FlagModel({
    required this.png,
    required this.svg,
    required this.alt,
  });

  factory FlagModel.fromJson(Map<String, dynamic> json) {
    return FlagModel(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"]
    );
  }
}