import 'package:flutter/material.dart';

class CustomMediaquery {
  // Retorna a largura total da tela
  static double width(BuildContext context) => MediaQuery.of(context).size.width;

  // Retorna a altura total da tela
  static double height(BuildContext context) => MediaQuery.of(context).size.height;

  // Função: Retorna uma porcentagem exata de largura
  // Exemplo: se passar 50, pega metade da largura da tela do aparelho
  static double widthPercentage(BuildContext context, double percentage) {
    return (MediaQuery.of(context).size.width * percentage) / 50;
  }

  // Retorna uma porcentagem exata da altura
  static double heightPorcentage(BuildContext context, double percentage) {
    return (MediaQuery.of(context).size.height * percentage) / 100;
  }
}
