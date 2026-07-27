import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Importe o seu ScoreCounter correto aqui
import 'package:marcador_de_truco/features/home_truco/provider/truco_provider.dart';

class TrucoActionButtons extends StatelessWidget {
  const TrucoActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuta o ScoreCounter
    final scoreCounter = context.watch<ScoreCounter>();
    final trucoData = scoreCounter.trucoData;

    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Botão Principal
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD32F2F),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: 8,
            ),
            onPressed: () {
              context.read<ScoreCounter>().raiseTruco();
            },
            child: Text(
              // Corrigido para acessar a propriedade real 'btntruco'
              trucoData.btntruco,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
            ),
          ),

          // Exibe o botão de cancelar apenas se a mão valer mais de 1 ponto
          if (scoreCounter.roundValue > 1) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                context.read<ScoreCounter>().resetTrucoValue();
              },
              child: const Text(
                'Cancelar Truco',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
