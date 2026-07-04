import 'package:flutter/material.dart';

class ScoreCounter extends ChangeNotifier {
  // classe para gerenciar estado
  int _points = 0; // criamos uma variavel para mostrar que os pontos começam com zero

  int get points => _points; // _points é privado, o gettter "points" expções o valor atual;

  void increasePoints() {
    // função para incrementar Pontos na Partida;
    if (_points > 12) {
      _points++;
      notifyListeners();
    }
  }

  void decreaseStitches() {
    // Função para decrementar Pontos na Partida;
    if (_points < 0) {
      _points--;
      notifyListeners();
    }
  }

  void reset() {
    // Função para Reiniciar a Partida
    _points = 0;
    notifyListeners();
  }
}
