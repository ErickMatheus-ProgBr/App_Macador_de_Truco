import 'package:flutter/material.dart';
import 'package:marcador_de_truco/core/theme/theme_colors.dart';
import 'package:marcador_de_truco/features/home_truco/provider/animated_provider.dart';
import 'package:marcador_de_truco/features/home_truco/provider/truco_provider.dart';
import 'package:marcador_de_truco/features/home_truco/views/home_screen.dart';
import 'package:provider/provider.dart'; // 👈 ADICIONE ESSA LINHA AQUI!

void main() {
  // Garante a inicialização das rotinas nativas do Flutter antes de subir o app
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    // MultiProvider: Registra todos os gerenciadores de estado no topo da árvore.
    // Isso torna os Providers acessíveis em qualquer tela do aplicativo.
    MultiProvider(
      providers: [
        // Controller responsável pela lógica de pontuação, placar e vitórias do Truco
        ChangeNotifierProvider(
          create: (context) => ScoreCounter(), // 👈 Instancia o seu controller aqui
        ),
        // Controller responsável pelo estado das animações da interface
        ChangeNotifierProvider(create: (context) => AnimatedProvider()),
      ],
      // Widget principal que inicia a aplicação
      child: const AppTruco(),
    ),
  );
}

/// Widget Raiz do Aplicativo (Configurações Globais de Tema e Rota Inicial)
class AppTruco extends StatelessWidget {
  const AppTruco({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Esconde a faixa de 'DEBUG' no canto superior
      title: "Marcador de Truco", // Nome do app no gerenciador de tarefas
      theme: ThemeColors.myThemeApp, // Tema visual customizado da aplicação
      home: const HomeScreen(), // Tela inicial exibida ao abrir o app
    );
  }
}
