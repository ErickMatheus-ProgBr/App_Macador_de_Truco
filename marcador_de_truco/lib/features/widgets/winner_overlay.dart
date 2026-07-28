import 'package:flutter/material.dart';
import 'package:marcador_de_truco/features/home_truco/provider/truco_provider.dart';
import 'package:provider/provider.dart';

class WinnerOverlay extends StatelessWidget {
  const WinnerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final txt = context.watch<ScoreCounter>();

    return Stack(
      children: [
        // Fundo escurecido semi-transparente para dar foco ao campeão
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.85))),

        // Elementos visuais do Vencedor (Animação GIF + Texto + Botão)
        Positioned.fill(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // GIF de vitória
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset(
                    txt.currentVictoryGif, // Lê o caminho local sorteado pelo Provider
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.emoji_events, size: 80, color: Colors.amber),
                          SizedBox(height: 10),
                          Text("Erro ao carregar o GIF! 🏆", style: TextStyle(color: Colors.white)),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),

                // Nome do Time Vencedor dinâmico
                Text(
                  "Vencedor: \n${txt.trucoData.winnerTeam.toUpperCase()} 🤩",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),

                // Botão para resetar e iniciar uma nova partida
                ElevatedButton.icon(
                  onPressed: () => txt.restartGame(), // Chama a função do Provider
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 5,
                  ),
                  icon: const Icon(Icons.refresh, fontWeight: FontWeight.bold),
                  label: const Text(
                    "Começar outra rodada",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
