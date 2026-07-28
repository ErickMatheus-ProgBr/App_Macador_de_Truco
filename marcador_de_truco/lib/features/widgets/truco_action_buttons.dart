import 'package:flutter/material.dart';
import 'package:marcador_de_truco/features/home_truco/provider/truco_provider.dart';
import 'package:provider/provider.dart';

class TrucoActionButtons extends StatelessWidget {
  const TrucoActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final txt = context.watch<ScoreCounter>();

    return Positioned(
      bottom: 60, // Posição no rodapé da tela
      left: 0,
      right: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ocupa apenas o espaço necessário
        children: [
          // 1. Botão Principal do Truco (Design e cores originais)
          ElevatedButton(
            onPressed: () => txt.raiseTruco(),
            style: ElevatedButton.styleFrom(
              backgroundColor: txt.roundValue > 1 ? const Color(0xFFFCFCFC) : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: Text(
              txt.roundValue == 1
                  ? "TRUCO!"
                  : "VALE ${txt.roundValue}!", // Muda de TRUCO! para VALE 3!, VALE 6!...
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          // 2. Botão "CANCELAR TRUCO" (Design e visibilidade dinâmicos originais)
          if (txt.roundValue > 1) ...[
            const SizedBox(height: 20), // Espacinho entre os botões
            ElevatedButton(
              onPressed: () => txt.resetTrucoValue(), // Cancela e volta para 1 ponto
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                "CANCELAR TRUCO",
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
