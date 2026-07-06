import 'package:flutter/material.dart';
import 'package:marcador_de_truco/core/utils/media_query.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(2),
            width: CustomMediaquery.width(context),
            height: CustomMediaquery.heightPorcentage(context, 40),
            child: Column(),
          ),
        ],
      ),
    );
  }
}
