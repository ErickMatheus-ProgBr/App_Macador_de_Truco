import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 👈 1. IMPORTANTE: Importar o shared_preferences
import 'package:marcador_de_truco/features/home_truco/provider/truco_provider.dart';

void main() {
  // 👇 2. ADICIONE ESTAS DUAS LINHAS AQUI NO TOPO DO MAIN:
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues(
    {},
  ); // Cria um armazenamento 'fake' na memória para os testes

  group('Testes de Pontuação do TrucoProvider', () {
    test('O placar deve iniciar zerado (0 x 0)', () async {
      final provider = TrucoProvider();

      expect(provider.pontosNos, 0);
      expect(provider.pontosEles, 0);
    });

    test('Deve somar 3 pontos para a dupla "Nós" quando acionado', () async {
      final provider = TrucoProvider();

      provider.adicionarPontosNos(3);

      expect(provider.pontosNos, 3);
    });

    test('Deve zerar a pontuação de ambas as duplas ao reiniciar a partida', () async {
      final provider = TrucoProvider();
      provider.adicionarPontosNos(6);
      provider.adicionarPontosEles(9);

      provider.reiniciarPartida();

      expect(provider.pontosNos, 0);
      expect(provider.pontosEles, 0);
    });
  });
}
