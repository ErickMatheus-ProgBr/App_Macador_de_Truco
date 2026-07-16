import 'package:flutter/material.dart';
import 'package:marcador_de_truco/core/fonts/customFonts.dart';
import 'package:marcador_de_truco/core/theme/theme_colors.dart';

import 'package:marcador_de_truco/core/utils/media_query.dart';
import 'package:marcador_de_truco/features/home_truco/provider/truco_provider.dart';

import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final txt = context.watch<ScoreCounter>();

    return Scaffold(
      key: _scaffoldKey, // vincula a chave ao SCAFFOLD
      // O drawer nativo fica aqui. Ele abre flutuando por cima da tela, sem ocupar o espaco fisico da tela

      // Drawer
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Cabeçalho do drawer
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.only(top: -40, left: 18),
                child: Row(
                  children: [
                    Icon(Icons.palette, color: Colors.pinkAccent, size: 40),
                    SizedBox(width: 4),
                    Text("Cores", style: TextStyle(color: Colors.black, fontSize: 35)),
                  ],
                ),
              ),
              ListTile(leading: Icon(Icons.palette)),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // LADO ESQUERDO
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: ThemeColors.myThemeApp.colorScheme.primary,
                  margin: EdgeInsets.zero,
                  width: CustomMediaquery.width(context),
                  height: CustomMediaquery.heightPorcentage(context, 100),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Nome do time Esquerdo
                        Text(txt.trucoData.timeA, style: Customfonts.timeNameStyle),
                        // Pontuação do time Esquerdo
                        Text("${txt.trucoData.pointsA}", style: Customfonts.pointsStyle),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                txt.increasePointsA(); //Chama a função de aumentar o ponto do Time A
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                                minimumSize: const Size(40, 10),
                                elevation: 8,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),

                              // Somar ponto
                              child: Text(
                                "${txt.trucoData.decre}", //
                                style: Customfonts.counter.copyWith(
                                  color: TextTheme.of(context).bodyLarge?.color,
                                ),
                              ),
                            ),

                            SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () {
                                txt.decreasePointsA(); // Função para diminuir pontos do time A
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                                elevation: 8,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),

                              // Diminuir pontos
                              child: Text(
                                "${txt.trucoData.incre}",
                                style: Customfonts.counter.copyWith(
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
                  width: CustomMediaquery.width(context),
                  height: CustomMediaquery.heightPorcentage(context, 100),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(txt.trucoData.timeB, style: Customfonts.timeNameStyle),
                        Text("${txt.trucoData.pointsB}", style: Customfonts.pointsStyle),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                txt.increasePointsB();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                                minimumSize: const Size(40, 10),
                                elevation: 8,
                                shadowColor: const Color(0xFF727272),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                "${txt.trucoData.decre}", //
                                style: Customfonts.counter.copyWith(
                                  color: TextTheme.of(context).bodyLarge?.color,
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                txt.decreasePointsB();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                                minimumSize: const Size(40, 10),
                                elevation: 8,
                                shadowColor: const Color(0xFF727272),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                "${txt.trucoData.incre}",
                                style: Customfonts.counter.copyWith(
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
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,

            child: Center(child: Text(txt.trucoData.gameName, style: Customfonts.nameApp)),
          ),

          Positioned(
            bottom: 60, // Posição no rodapé da tela
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ocupa apenas o espaço necessário
              children: [
                // 1. Botão Principal do Truco (Muda o texto dinamicamente baseado no roundValue!)
                ElevatedButton(
                  onPressed: () => txt.increaseTrucoValue(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: txt.roundValue > 1 ? const Color(0xFFFCFCFC) : Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    txt.roundValue == 1
                        ? "TRUCO!"
                        : "VALE ${txt.roundValue}!", // 👈 Muda de TRUCO! para VALE 3!, VALE 6!...
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // 2. Espaço dinâmico: Só mostra o botão "CANCEL" se o jogo estiver realmente trucado (roundValue > 1)
                if (txt.roundValue > 1) ...[
                  const SizedBox(height: 10), // Espacinho entre os botões
                  ElevatedButton(
                    onPressed: () => txt.resetTrucoValue(), // Cancela e volta para 1 ponto
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ],
              ],
            ),
          ),

          Positioned(
            top: 50,
            left: 0,

            child: FloatingActionButton(
              mini: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: Icon(Icons.menu, color: const Color(0xFFF5F5F5), size: 48),
            ),
          ),
        ],
      ),
    );
  }
}
