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
      drawer: Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.all(14),
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
          // 1. O fundo colorido vem PRIMEIRO (por baixo de tudo)
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
                        Text(txt.trucoData.timeA, style: Customfonts.timeNameStyle),

                        Text("${txt.trucoData.pointsA}", style: Customfonts.pointsStyle),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
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
                              child: Text(
                                "${txt.trucoData.decre}", //
                                style: Customfonts.counter.copyWith(
                                  color: TextTheme.of(context).bodyLarge?.color,
                                ),
                              ),
                            ),

                            SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                                elevation: 8,
                                shadowColor: Colors.black,
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
                              onPressed: () {},
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
                              onPressed: () {},
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
            bottom: 155,
            left: 49,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 70),
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5)),
                elevation: 5,
              ),
              onPressed: () {}, //
              child: Text(
                txt.trucoData.btntruco,
                style: Customfonts.btnLast.copyWith(color: TextTheme.of(context).bodySmall?.color),
              ),
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
