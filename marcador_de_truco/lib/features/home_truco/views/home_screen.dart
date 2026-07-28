import 'package:flutter/material.dart';
import 'package:marcador_de_truco/core/fonts/customFonts.dart';
import 'package:marcador_de_truco/features/home_truco/provider/truco_provider.dart';
import 'package:marcador_de_truco/features/widgets/drawerWidget.dart';
import 'package:marcador_de_truco/features/widgets/team_score_colum.dart';
import 'package:marcador_de_truco/features/widgets/truco_action_buttons.dart';
import 'package:marcador_de_truco/features/widgets/winner_overlay.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final txt = context.watch<ScoreCounter>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      body: Stack(
        children: [
          // 1. Colunas dos Times (Lado Esquerdo e Direito)
          const TeamScoreColum(isTeamA: true),

          // 2. Título Central Superior
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(child: Text(txt.trucoData.gameName, style: CustomFonts.nameApp)),
          ),

          // 3. Botão do Menu (Drawer)
          Positioned(
            top: 50,
            left: 0,
            child: FloatingActionButton(
              mini: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: const Icon(Icons.menu, color: Color(0xFFF5F5F5), size: 48),
            ),
          ),

          // 4. Botões de Ação do Truco (Rodapé)
          const TrucoActionButtons(),

          // 5. Overlay de Vitória (Apenas quando houver campeão)
          if (txt.trucoData.winner) const WinnerOverlay(),
        ],
      ),
    );
  }
}
