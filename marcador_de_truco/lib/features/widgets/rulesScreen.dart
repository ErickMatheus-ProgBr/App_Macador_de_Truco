import 'dart:ui';

import 'package:flutter/material.dart';

class Rulesscreen extends StatelessWidget {
  const Rulesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF235725), //
          title: Text(
            "Regras e Manilhas", //
            style: TextStyle(color: Colors.white, fontSize: 23),
          ),
        ),
      ),
    );
  }
}
