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
      _roundValue = 6;
    } else if (_roundValue == 6) {
      _roundValue = 9;
    } else if (_roundValue == 9) {
      _roundValue = 12;
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
  );

  // Getter for UI to read data
  TrucoModel get trucoData => _trucoData;

  // Increments Team A points using the current roundValue
  void increasePointsA() {
    if (_trucoData.pointsA < 12) {
      int newPoints = _trucoData.pointsA + _roundValue;
      if (newPoints > 12) newPoints = 12; // Cap at 12 points

      _trucoData = TrucoModel(
        gameName: _trucoData.gameName,
        caption: _trucoData.caption,
        timeA: _trucoData.timeA,
        timeB: _trucoData.timeB,
        decre: _trucoData.decre,
        incre: _trucoData.incre,
        pointsA: newPoints,
        pointsB: _trucoData.pointsB,
        btntruco: _trucoData.btntruco,
      );

      // Automatically resets round value back to 1 after scoring
      _roundValue = 1;
      notifyListeners();
    }
  }

  // Decrements Team A points (always by 1)
  void decreasePointsA() {
    if (_trucoData.pointsA > 0) {
      _trucoData = TrucoModel(
        gameName: _trucoData.gameName,
        caption: _trucoData.caption,
        timeA: _trucoData.timeA,
        timeB: _trucoData.timeB,
        decre: _trucoData.decre,
        incre: _trucoData.incre,
        pointsA: _trucoData.pointsA - 1,
        pointsB: _trucoData.pointsB,
        btntruco: _trucoData.btntruco,
      );
      notifyListeners();
    }
  }

  // Increments Team B points using the current roundValue
  void increasePointsB() {
    if (_trucoData.pointsB < 12) {
      int newPoints = _trucoData.pointsB + _roundValue;
      if (newPoints > 12) newPoints = 12; // Cap at 12 points

      _trucoData = TrucoModel(
        gameName: _trucoData.gameName,
        caption: _trucoData.caption,
        timeA: _trucoData.timeA,
        timeB: _trucoData.timeB,
        decre: _trucoData.decre,
        incre: _trucoData.incre,
        pointsA: _trucoData.pointsA,
        pointsB: newPoints,
        btntruco: _trucoData.btntruco,
      );

      // Automatically resets round value back to 1 after scoring
      _roundValue = 1;
      notifyListeners();
    }
  }

  // Decrements Team B points (always by 1)
  void decreasePointsB() {
    if (_trucoData.pointsB > 0) {
      _trucoData = TrucoModel(
        gameName: _trucoData.gameName,
        caption: _trucoData.caption,
        timeA: _trucoData.timeA,
        timeB: _trucoData.timeB,
        decre: _trucoData.decre,
        incre: _trucoData.incre,
        pointsA: _trucoData.pointsA,
        pointsB: _trucoData.pointsB - 1,
        btntruco: _trucoData.btntruco,
      );
      notifyListeners();
    }
  }
}
