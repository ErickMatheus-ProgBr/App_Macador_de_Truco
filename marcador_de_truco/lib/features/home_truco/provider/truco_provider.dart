import 'package:flutter/material.dart';
import 'package:marcador_de_truco/features/home_truco/data/models/truco_model.dart';

class ScoreCounter extends ChangeNotifier {
  int _roundValue = 1; // Starts at 1 point for normal rounds
  int get roundValue => _roundValue;

  // Rotates the Truco value: 3 -> 6 -> 9 -> 12 -> 3
  void increaseTrucoValue() {
    if (_roundValue == 1) {
      _roundValue = 3;
    } else if (_roundValue == 3) {
      _roundValue = 6; // sai de 3 para 6 pontos se a arquipe concordar
    } else if (_roundValue == 6) {
      _roundValue = 9; // de 6 sai para 9 pontos se aceitarem a seizada
    } else if (_roundValue == 9) {
      _roundValue = 12; // de 9 pontos podem aumentar para 12 pontos ;
    } else if (_roundValue == 12) {
      _roundValue = 3;
    }
    notifyListeners();
  }

  // Resets the round value back to 1 (Cancel action)
  void resetTrucoValue() {
    _roundValue = 1;
    notifyListeners();
  }

  // Model initialization
  TrucoModel _trucoData = TrucoModel(
    gameName: "Truco",
    caption: "Marcador",
    timeA: "Time A",
    timeB: "Time B",
    decre: "+1",
    incre: "-1",
    pointsA: 0,
    pointsB: 0,
    btntruco: "TRUCOOOO!",
    winner: false,
    winnerTeam: "Time vencedor",
  );

  // Getter for UI to read data
  TrucoModel get trucoData => _trucoData;

  // Função que verifica se o jogo acabou
  void winTruco() {
    if (_trucoData.pointsA == 12) {
      _trucoData = _trucoData.copyWith(winner: true, winnerTeam: _trucoData.timeA);
    } else if (_trucoData.pointsB == 12) {
      _trucoData = _trucoData.copyWith(winner: true, winnerTeam: _trucoData.timeB);
    }
  }

  // Increments Team A points using the current roundValue
  void increasePointsA() {
    if (_trucoData.pointsA < 12 && !_trucoData.winner) {
      int newPoints = _trucoData.pointsA + _roundValue;
      if (newPoints > 12) newPoints = 12; // Cap at 12 points

      // 💡 OLHA COMO FICOU LIMPO: Altera apenas o pointsA! As outras propriedades permanecem salvas
      _trucoData = _trucoData.copyWith(pointsA: newPoints);

      // Automatically resets round value back to 1 after scoring
      _roundValue = 1;
      winTruco();
      notifyListeners();
    }
  }

  // Decrements Team A points (always by 1)
  void decreasePointsA() {
    // Só deixa diminuir se ninguém tiver vencido o jogo ainda
    if (_trucoData.pointsA > 0 && !_trucoData.winner) {
      _trucoData = _trucoData.copyWith(pointsA: _trucoData.pointsA - 1);
      notifyListeners();
    }
  }

  // Increments Team B points using the current roundValue
  void increasePointsB() {
    if (_trucoData.pointsB < 12 && !_trucoData.winner) {
      int newPoints = _trucoData.pointsB + _roundValue;
      if (newPoints > 12) newPoints = 12; // Cap at 12 points

      _trucoData = _trucoData.copyWith(pointsB: newPoints);

      // Automatically resets round value back to 1 after scoring
      _roundValue = 1;
      winTruco();
      notifyListeners();
    }
  }

  // Decrements Team B points (always by 1)
  void decreasePointsB() {
    if (_trucoData.pointsB > 0 && !_trucoData.winner) {
      _trucoData = _trucoData.copyWith(pointsB: _trucoData.pointsB - 1);
      notifyListeners();
    }
  }

  // 🔄 Função bônus para quando você quiser resetar o jogo para uma nova partida
  void restartGame() {
    _trucoData = TrucoModel(
      gameName: "Truco",
      caption: "Marcador",
      timeA: _trucoData.timeA,
      timeB: _trucoData.timeB,
      decre: "+1",
      incre: "-1",
      pointsA: 0,
      pointsB: 0,
      btntruco: "TRUCOOOO!",
      winner: false,
      winnerTeam: "",
    );
    _roundValue = 1;
    notifyListeners();
  }
}
