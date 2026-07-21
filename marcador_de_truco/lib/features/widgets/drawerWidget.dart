import 'package:flutter/material.dart';
import 'package:marcador_de_truco/features/widgets/rulesScreen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key}); // O const aqui impede o travamento na animação!

  @override
  Widget build(BuildContext context) {
    // Retornamos DIRETO o Drawer, sem outro Scaffold em volta
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Cabeçalho do Drawer
            DrawerHeader(
              decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 36, 36)),
              padding: const EdgeInsets.only(top: 20, left: 18),
              child: Row(
                children: const [
                  Icon(Icons.zoom_out_map_rounded, color: Color(0xFF727272), size: 40),
                  SizedBox(width: 8),
                  Text(
                    "Dicas",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Item de opção no menu
            ListTile(
              leading: Icon(Icons.add_to_home_screen_sharp, color: Colors.black),
              title: Text(
                "Regras e Manilhas", //
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Rulesscreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
