import 'package:flutter/material.dart';
import 'package:marcador_de_truco/core/fonts/customFonts.dart';
import 'package:marcador_de_truco/core/theme/theme_colors.dart';
import 'package:marcador_de_truco/features/home_truco/provider/animated_provider.dart';
import 'package:marcador_de_truco/features/home_truco/provider/truco_provider.dart';
import 'package:provider/provider.dart';

class TeamScoreColum extends StatefulWidget {
  const TeamScoreColum({super.key, required bool isTeamA});

  @override
  State<TeamScoreColum> createState() => _TeamScoreColumState();
}

class _TeamScoreColumState extends State<TeamScoreColum> {
  @override
  Widget build(BuildContext context) {
    // CORRIGIDO: Aceita apenas o 'context'
    // Pegamos o TrucoProvider aqui dentro do build
    final txt = context.watch<ScoreCounter>();
    final animated = context.watch<AnimatedProvider>();

    return Row(
      children: [
        // LADO ESQUERDO
        Expanded(
          flex: 1,
          child: Container(
            color: ThemeColors.myThemeApp.colorScheme.primary,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Nome do time Esquerdo
                  Text(txt.trucoData.timeA, style: CustomFonts.timeNameStyle),
                  // Pontuação do time Esquerdo
                  Text("${txt.trucoData.pointsA}", style: CustomFonts.pointsStyle),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          txt.increasePointsA(); // Chama a função de aumentar o ponto do Time A
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                          minimumSize: const Size(40, 10),
                          elevation: 8,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        // Somar ponto
                        child: Text(
                          "${txt.trucoData.decre}",
                          style: CustomFonts.counter.copyWith(
                            color: TextTheme.of(context).bodyLarge?.color,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          txt.decreasePointsA(); // Função para diminuir pontos do time A
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                          minimumSize: const Size(40, 10),
                          elevation: 8,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        // Diminuir pontos
                        child: Text(
                          "${txt.trucoData.incre}",
                          style: CustomFonts.counter.copyWith(
                            color: TextTheme.of(context).bodyLarge?.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // TIME DO LADO DIREITO
        Expanded(
          flex: 1,
          child: Container(
            color: ThemeColors.myThemeApp.colorScheme.secondary,
            margin: EdgeInsets.zero,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(txt.trucoData.timeB, style: CustomFonts.timeNameStyle),
                  Text("${txt.trucoData.pointsB}", style: CustomFonts.pointsStyle),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          txt.increasePointsB();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                          minimumSize: const Size(40, 10),
                          elevation: 8,
                          shadowColor: const Color(0xFF727272),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text(
                          "${txt.trucoData.decre}",
                          style: CustomFonts.counter.copyWith(
                            color: TextTheme.of(context).bodyLarge?.color,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          txt.decreasePointsB();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                          minimumSize: const Size(40, 10),
                          elevation: 8,
                          shadowColor: const Color(0xFF727272),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Text(
                          "${txt.trucoData.incre}",
                          style: CustomFonts.counter.copyWith(
                            color: TextTheme.of(context).bodyLarge?.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ); // CORRIGIDO: Fechamento do Row e ponto e vírgula no final do return
  }
}
