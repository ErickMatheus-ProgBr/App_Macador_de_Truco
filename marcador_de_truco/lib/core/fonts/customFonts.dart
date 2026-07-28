import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Classe utilitária contendo os estilos tipográficos centralizados do aplicativo.
// Usa [GoogleFonts] para garantir tipografias personalizadas e consistentes.
class CustomFonts {
  // Estilo do Título Principal/Nome do Aplicativo
  static TextStyle nameApp = GoogleFonts.zalandoSans(fontSize: 84, fontWeight: FontWeight.bold);

  // Estilo para a exibição dos nomes dos times (Time A / Time B)
  static TextStyle timeNameStyle = GoogleFonts.poppins(fontSize: 41, fontWeight: FontWeight.bold);

  // Estilo com destaque para a contagem númerica de pontos
  static TextStyle pointsStyle = GoogleFonts.roboto(fontSize: 125, fontWeight: FontWeight.bold);

  // Botões de incrementar(+1) e decrementar (-1)
  static TextStyle counter = GoogleFonts.bungee(fontSize: 26, fontWeight: FontWeight.bold);
}
