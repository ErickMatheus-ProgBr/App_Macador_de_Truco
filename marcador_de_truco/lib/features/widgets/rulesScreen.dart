import 'dart:ui';

import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

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
            style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            _buildSelectionTitle("🏆 Manilhas"),

            SizedBox(height: 20),
            Card(
              elevation: 10,
              child: Column(
                children: const [
                  _ManilhaItem(details: "Primeira carta mais forte do jogo ♣"),
                  Divider(),
                  _ManilhaItem(details: "A segunda carta maior do jogo ♥"),
                  Divider(),
                  _ManilhaItem(details: "A terceira maior ♠"),
                  Divider(),
                  _ManilhaItem(details: "Quarta maior ♦"),
                ],
              ),
            ),

            SizedBox(height: 20),

            _buildSelectionTitle("🃏Ordem das cartas"),

            SizedBox(height: 10),

            Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    "   Da mais fraca até a mais forte:\n\n3 ➝ 2 ➝ A ➝ A ➝ J ➝ Q ➝ 7 ➝ 6  \n5 ➝ 4 ",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 19,
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            _buildSelectionTitle("🔢 Pontuação das rodadas"),

            SizedBox(height: 20),

            Card(
              elevation: 10,
              child: Column(
                children: [
                  ListTile(
                    title: Text("Rodadas normais"),
                    subtitle: Text("1 ponto por rodada"),
                    leading: CircleAvatar(child: Text("1")),
                  ),

                  ListTile(
                    title: Text("Truco!!"),
                    subtitle: Text("Vale 3 pontos"),
                    leading: CircleAvatar(child: Text("2")),
                  ),
                  ListTile(
                    title: Text("Seisss!!"),
                    subtitle: Text("Vale 6 pontos"),
                    leading: CircleAvatar(child: Text("3")),
                  ),
                  ListTile(
                    title: Text("Novee!!"),
                    subtitle: Text("Vale 9 pontos"),
                    leading: CircleAvatar(child: Text("4")),
                  ),

                  ListTile(
                    title: Text("Doze!!"),
                    subtitle: Text("Vale a partida"),
                    leading: CircleAvatar(child: Text("5")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ManilhaItem extends StatelessWidget {
  final String details;

  const _ManilhaItem({required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Text(
            details,
            style: TextStyle(
              color: const Color(0xFF616161),
              fontSize: 14.4,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildSelectionTitle(String title) {
  return Text(
    //
    title,
    style: TextStyle(
      color: Colors.black,
      fontSize: 21,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  );
}
