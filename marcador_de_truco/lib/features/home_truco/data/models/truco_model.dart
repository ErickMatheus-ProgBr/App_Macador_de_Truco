class TrucoModel {
  final String gameName;
  final String caption;
  final String timeA;
  final String timeB;
  final int pointsA;
  final int pointsB;

  TrucoModel({
    required this.gameName,
    required this.caption,
    required this.timeA,
    required this.timeB,
    required this.pointsA,
    required this.pointsB,
  });

  factory TrucoModel.fromJson(Map<String, dynamic> json) {
    return TrucoModel(
      gameName: json["TRUCO"] ?? "Truco",
      caption: json["Marcador"],
      timeA: json["Time A"],
      timeB: json["Time B"],
      pointsA: json["Pontos Time A"] ?? 0,
      pointsB: json["Pontos Time B"] ?? 0,
    );
  }
}
