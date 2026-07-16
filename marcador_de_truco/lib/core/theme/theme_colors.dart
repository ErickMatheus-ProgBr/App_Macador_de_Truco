import 'package:flutter/material.dart';

class ThemeColors {
  // O static permite acessar direto como: ThemeColors.myThemeApp
  static ThemeData myThemeApp = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.red,
      secondary: Colors.black,
      tertiary: Colors.white,
    ),
    textTheme: const TextTheme(
      // Agrupamentos de estilo de texto para o app.
      bodyLarge: TextStyle(color: Colors.white), // estilo pré-definido
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Color.fromARGB(31, 182, 44, 44)),
    ),
  );
}
