import 'package:flutter/material.dart';
import 'package:marcador_de_truco/core/theme/theme_colors.dart';
import 'package:marcador_de_truco/features/home_truco/views/home_screen.dart';

void main() {
  runApp(AppTruco());
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
