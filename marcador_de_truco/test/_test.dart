import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:marcador_de_truco/features/home_truco/provider/truco_provider.dart';

void main() {
  // Garante o ambiente de testes do Flutter e mocka o SharedPreferences na memória
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('Testes de Pontuação do ScoreCounter', () {
    test('O placar deve iniciar zerado (0 x 0)', () async {
      // 💡 Instancia o controller corretamente com parênteses ()
      final provider = ScoreCounter();

      expect(provider.trucoData.pointsA, 0);
      expect(provider.trucoData.pointsB, 0);
    });

    test('Deve incrementar os pontos do Time A quando acionado', () async {
      final provider = ScoreCounter();

      provider.increasePointsA();

      // Ajuste o valor esperado de acordo com a quantidade de pontos que sua função soma
      expect(provider.trucoData.pointsA, 1);
    });

    test('Deve zerar a pontuação de ambas as duplas ao reiniciar a partida', () async {
      final provider = ScoreCounter();

      // Simula uma partida com pontos
      provider.increasePointsA();
      provider.increasePointsB();

      // Reinicia a partida
      provider.restartGame();

      expect(provider.trucoData.pointsA, 0);
      expect(provider.trucoData.pointsB, 0);
      expect(provider.trucoData.winner, false);
    });
  });
}
