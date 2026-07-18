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
  final bool winner;
  final String winnerTeam;

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
    required this.winner,
    required this.winnerTeam,
  });

  // 💡 A MÁGICA ESTÁ AQUI: Esse método clona o modelo alterando apenas os parâmetros enviados
  // O método copyWith serve para "copiar" um objeto alterando apenas o que você pedir.
  TrucoModel copyWith({
    String? gameName,
    String? caption,
    String? timeA,
    String? timeB,
    String? decre,
    String? incre,
    int? pointsA,
    int? pointsB,
    String? btntruco,
    bool? winner,
    String? winnerTeam,
  }) {
    return TrucoModel(
      gameName: gameName ?? this.gameName,
      caption: caption ?? this.caption,
      timeA: timeA ?? this.timeA,
      timeB: timeB ?? this.timeB,
      decre: decre ?? this.decre,
      incre: incre ?? this.incre,
      pointsA: pointsA ?? this.pointsA,
      pointsB: pointsB ?? this.pointsB,
      btntruco: btntruco ?? this.btntruco,
      winner: winner ?? this.winner,
      winnerTeam: winnerTeam ?? this.winnerTeam,
    );
  }

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
      winner: json["winner"] ?? false,
      winnerTeam: json["Time vencedor:"],
    );
  }
}
