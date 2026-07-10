import 'package:flutter/material.dart';
import 'package:marcador_de_truco/core/theme/theme_colors.dart';
import 'package:marcador_de_truco/features/home_truco/provider/truco_provider.dart';
import 'package:marcador_de_truco/features/home_truco/views/home_screen.dart';
import 'package:provider/provider.dart'; // 👈 ADICIONE ESSA LINHA AQUI!

import 'package:path_provider/path_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // 1. Envelopamos o app todo com o Provedor de Estado
        ChangeNotifierProvider(
          create: (context) => ScoreCounter(), // 👈 Instancia o seu controller aqui
        ),
      ],
      child: const AppTruco(),
    ),
  );
}

class AppTruco extends StatelessWidget {
  const AppTruco({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Marcador de Truco",
      theme: ThemeColors.myThemeApp,
      home: HomeScreen(),
    );
  }
}
