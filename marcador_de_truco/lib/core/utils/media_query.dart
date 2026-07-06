import 'package:flutter/material.dart';

class Mediaquery {
  // Retorna a largura total da tela
  static double width(BuildContext context) => MediaQuery.of(context).size.width;

  // Retorna a altura total da tela
  static double height(BuildContext context) => MediaQuery.of(context).size.height;

  // Verifica se o dispositivo é um celular (largura menor que 600px)
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }
}
