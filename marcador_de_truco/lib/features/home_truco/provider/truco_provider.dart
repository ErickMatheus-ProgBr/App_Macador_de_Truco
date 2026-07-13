import 'package:flutter/material.dart';
import 'package:marcador_de_truco/features/home_truco/data/models/truco_model.dart';

class ScoreCounter extends ChangeNotifier {
  // Inicializamos o nosso modelo com os valores padrão do jogo
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

  // Getter para a HomeScreen conseguir ler todos os dados
  TrucoModel get trucoData => _trucoData;

  // Função para incrementar pontos do Time A
  void increasePointsA() {
    if (_trucoData.pointsA < 12) {
      // O jogo de truco vai até 12!
      _trucoData = TrucoModel(
        gameName: _trucoData.gameName,
        caption: _trucoData.caption,
        timeA: _trucoData.timeA,
        timeB: _trucoData.timeB,
        decre: _trucoData.decre,
        incre: _trucoData.incre,
        pointsA: _trucoData.pointsA + 1, // Incrementa o time A
        pointsB: _trucoData.pointsB,
        btntruco: _trucoData.btntruco,
      );
      notifyListeners(); // Avisa a HomeScreen para atualizar
    }
  }

  // Crie funções parecidas para diminuir e para gerenciar o Time B...
}
