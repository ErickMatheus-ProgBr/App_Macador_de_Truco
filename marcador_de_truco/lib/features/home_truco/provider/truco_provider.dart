import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marcador_de_truco/features/home_truco/data/models/truco_model.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrucoProvider extends ChangeNotifier {
  int _pontosNos = 0;
  int _pontosEles = 0;

  int get pontosNos => _pontosNos;
  int get pontosEles => _pontosEles;

  // CONSTRUTOR: Assim que o Provider é criado, ele busca os pontos salvos
  TrucoProvider() {
    _carregarPontosSalvos();
  }

  // 1. CARREGAR OS DADOS SALVOS NO CELULAR
  Future<void> _carregarPontosSalvos() async {
    final prefs = await SharedPreferences.getInstance();
    // Pega os pontos salvos. Se não existir nada ainda, padrão é 0
    _pontosNos = prefs.getInt('pontos_nos') ?? 0;
    _pontosEles = prefs.getInt('pontos_eles') ?? 0;
    notifyListeners(); // Atualiza a tela com os pontos recuperados
  }

  // 2. SALVAR OS DADOS NO CELULAR
  Future<void> _salvarPontos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('pontos_nos', _pontosNos);
    await prefs.setInt('pontos_eles', _pontosEles);
  }

  // 3. ADICIONAR PONTOS
  void adicionarPontosNos(int qtd) {
    _pontosNos += qtd;
    _salvarPontos(); // Grava a mudança no celular
    notifyListeners();
  }

  void adicionarPontosEles(int qtd) {
    _pontosEles += qtd;
    _salvarPontos(); // Grava a mudança no celular
    notifyListeners();
  }

  // 4. ZERAR PARTIDA
  void reiniciarPartida() {
    _pontosNos = 0;
    _pontosEles = 0;
    _salvarPontos(); // Reseta os dados gravados no celular
    notifyListeners();
  }
}

class ScoreCounter extends ChangeNotifier {
  int _roundValue = 1; // Starts at 1 point for normal rounds
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
  // Variable to store the currently chosen GIF URL
  String _currentVictoryGif = '';
  String get currentVictoryGif => _currentVictoryGif; // Getter para a UI ler o GIF

  // ... (Mantenha suas outras funções como increaseTrucoValue, trucoData, etc.)

  // 👈 3. Atualize a sua função interna de checar vencedor para sortear o GIF:
  void _checkWinner() {
    if ((_trucoData.pointsA == 12 || _trucoData.pointsB == 12) && !_trucoData.winner) {
      // Sorteia um número aleatório de 0 a 9 baseado no tamanho da lista
      final random = Random();
      int randomIndex = random.nextInt(_victoryGifs.length);
      _currentVictoryGif = _victoryGifs[randomIndex]; // Guarda o GIF sorteado

      if (_trucoData.pointsA == 12) {
        _trucoData = _trucoData.copyWith(winner: true, winnerTeam: _trucoData.timeA);
      } else {
        _trucoData = _trucoData.copyWith(winner: true, winnerTeam: _trucoData.timeB);
      }
    }
  }

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
      _checkWinner();
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
      _checkWinner();
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
    notifyListeners();
  }
}
