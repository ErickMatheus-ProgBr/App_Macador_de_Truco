import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:marcador_de_truco/features/home_truco/data/models/truco_model.dart';

class ScoreCounter extends ChangeNotifier {
  int _roundValue = 1;
  int get roundValue => _roundValue;

  final List<String> _victoryGifs = [
    "assets/gif1.gif",
    "assets/gif2.webp",
    "assets/gif3.gif",
    "assets/gif4.gif",
    "assets/gif5.gif",
    "assets/gif6.gif",
    "assets/gif7.gif",
    "assets/gif8.webp",
    "assets/gif9.gif",
    "assets/gif10.gif",
  ];

  String _currentVictoryGif = '';
  String get currentVictoryGif => _currentVictoryGif;

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

  TrucoModel get trucoData => _trucoData;

  // Construtor Seguro: Carrega os dados salvos sem travar a UI
  ScoreCounter() {
    _carregarPontosSalvos();
  }

  // 1. CARREGAR PONTOS (Sem travar o build do Flutter)
  Future<void> _carregarPontosSalvos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      int pointsA = prefs.getInt('pointsA') ?? 0;
      int pointsB = prefs.getInt('pointsB') ?? 0;

      _trucoData = _trucoData.copyWith(pointsA: pointsA, pointsB: pointsB);

      // Checa se já havia um vencedor salvo
      _checkWinner();

      // Garante que o notifyListeners só rode APÓS a tela ser desenhada
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } catch (e) {
      debugPrint("Erro ao carregar SharedPreferences: $e");
    }
  }

  // 2. SALVAR PONTOS (Assíncrono e Seguro)
  Future<void> _salvarPontos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('pointsA', _trucoData.pointsA);
      await prefs.setInt('pointsB', _trucoData.pointsB);
    } catch (e) {
      debugPrint("Erro ao salvar SharedPreferences: $e");
    }
  }

  void _checkWinner() {
    if ((_trucoData.pointsA >= 12 || _trucoData.pointsB >= 12) && !_trucoData.winner) {
      final random = Random();
      int randomIndex = random.nextInt(_victoryGifs.length);
      _currentVictoryGif = _victoryGifs[randomIndex];

      if (_trucoData.pointsA >= 12) {
        _trucoData = _trucoData.copyWith(winner: true, winnerTeam: _trucoData.timeA, pointsA: 12);
      } else {
        _trucoData = _trucoData.copyWith(winner: true, winnerTeam: _trucoData.timeB, pointsB: 12);
      }
    }
  }

  void raiseTruco() {
    if (_roundValue == 1) {
      _roundValue = 3;
      _trucoData = _trucoData.copyWith(btntruco: "SEIS!");
    } else if (_roundValue == 3) {
      _roundValue = 6;
      _trucoData = _trucoData.copyWith(btntruco: "NOVE!");
    } else if (_roundValue == 6) {
      _roundValue = 9;
      _trucoData = _trucoData.copyWith(btntruco: "DOZE!");
    } else if (_roundValue == 9) {
      _roundValue = 12;
      _trucoData = _trucoData.copyWith(btntruco: "MÃO DE 12!");
    } else {
      _roundValue = 1;
      _trucoData = _trucoData.copyWith(btntruco: "TRUCOOOO!");
    }

    notifyListeners();
  }

  void resetTrucoValue() {
    _roundValue = 1;
    notifyListeners();
  }

  void increasePointsA() {
    if (_trucoData.pointsA < 12 && !_trucoData.winner) {
      int newPoints = _trucoData.pointsA + _roundValue;
      if (newPoints > 12) newPoints = 12;

      _trucoData = _trucoData.copyWith(pointsA: newPoints);
      _roundValue = 1;
      _checkWinner();
      _salvarPontos();
      notifyListeners();
    }
  }

  void decreasePointsA() {
    if (_trucoData.pointsA > 0 && !_trucoData.winner) {
      _trucoData = _trucoData.copyWith(pointsA: _trucoData.pointsA - 1);
      _salvarPontos();
      notifyListeners();
    }
  }

  void increasePointsB() {
    if (_trucoData.pointsB < 12 && !_trucoData.winner) {
      int newPoints = _trucoData.pointsB + _roundValue;
      if (newPoints > 12) newPoints = 12;

      _trucoData = _trucoData.copyWith(pointsB: newPoints);
      _roundValue = 1;
      _checkWinner();
      _salvarPontos();
      notifyListeners();
    }
  }

  void decreasePointsB() {
    if (_trucoData.pointsB > 0 && !_trucoData.winner) {
      _trucoData = _trucoData.copyWith(pointsB: _trucoData.pointsB - 1);
      _salvarPontos();
      notifyListeners();
    }
  }

  void restartGame() {
    _currentVictoryGif = "";
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
    _salvarPontos();
    notifyListeners();
  }
}
