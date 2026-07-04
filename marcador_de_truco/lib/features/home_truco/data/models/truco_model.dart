class userModel {
  final String gameName;
  final String timeA;
  final String timeB;

  const userModel({required this.gameName, required this.timeA, required this.timeB});

  factory userModel.fromJson(Map<String, dynamic> json) {
    return userModel(gameName: json["TRUCO"], timeA: json["Time A"], timeB: json["Time B"]);
  }
}
