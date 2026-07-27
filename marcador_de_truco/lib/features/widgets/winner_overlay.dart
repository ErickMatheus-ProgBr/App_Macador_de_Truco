import 'package:flutter/material.dart';
import 'package:marcador_de_truco/core/fonts/customFonts.dart';
import 'package:marcador_de_truco/features/home_truco/provider/truco_provider.dart';
import 'package:provider/provider.dart';

class WinnerOverlay extends StatelessWidget {
  const WinnerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    // CORRIGIDO: Nome do provider trocado de ScoreCounter para TrucoProvider
    final txt = context.watch<ScoreCounter>();

    return Container(
      // CORRIGIDO: Usando Colors.black87 (fundo escuro transparente sem aviso de deprecado)
      color: Colors.black87,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Texto informando quem ganhou
            Text(
              "VENCEDOR!",
              style: CustomFonts.timeNameStyle.copyWith(color: Colors.amber, fontSize: 28),
            ),

            const SizedBox(height: 10),

            // Nome do time campeão (exibe timeA ou timeB de acordo com a pontuação)
            Text(
              txt.trucoData.pointsA >= 12 ? txt.trucoData.timeA : txt.trucoData.timeB,
              style: CustomFonts.pointsStyle.copyWith(color: Colors.white),
            ),

            const SizedBox(height: 30),

            // Botão para reiniciar a partida
            ElevatedButton(
              onPressed: () {
                // Chama o método do seu TrucoProvider para zerar os pontos
                txt.resetTrucoValue();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text(
                "NOVA PARTIDA",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
