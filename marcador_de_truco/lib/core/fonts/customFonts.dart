import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart'; // 1. Importe o pacote aqui

class Customfonts {
  // Nome do Aplicativo
  static TextStyle nameApp = GoogleFonts.changa(fontSize: 24, fontWeight: FontWeight.bold);

  // Sub titulo do app
  static TextStyle subTitle = GoogleFonts.changa(fontSize: 11, fontWeight: FontWeight.w500);

  // Estilo para o campo de nome das equipes
  static TextStyle timeNameStyle = GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold);

  // Pontos
  static TextStyle pointsStyle = GoogleFonts.poppins(fontSize: 33, fontWeight: FontWeight.bold);

  // Botões de decrementar e incrementar
  static TextStyle counter = GoogleFonts.bungee(fontSize: 14, fontWeight: FontWeight.bold);

  // Historico
  static TextStyle baseboard = GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold);
}
