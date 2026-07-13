class TrucoModel {
  final String gameName;
  final String caption;
  final String timeA;
  final String timeB;
  final String decre;
  final String incre;
  final int pointsA;
  final int pointsB;
  final String btntruco;

  TrucoModel({
    required this.gameName,
    required this.caption,
    required this.timeA,
    required this.timeB,
    required this.decre,
    required this.incre,
    required this.pointsA,
    required this.pointsB,
    required this.btntruco,
  });

  factory TrucoModel.fromJson(Map<String, dynamic> json) {
    return TrucoModel(
      gameName: json["TRUCO"] ?? "Truco",
      caption: json["Marcador"],
      timeA: json["Time A"],
      timeB: json["Time B"],
      decre: json["+1"] ?? "+1",
      incre: json["-1"] ?? "-1",
      pointsA: json["Pontos Time A"] ?? 0,
      pointsB: json["Pontos Time B"] ?? 0,
      btntruco: json["TRUCOOOO!"] ?? "TRUCOOOO!",
    );
  }
}
