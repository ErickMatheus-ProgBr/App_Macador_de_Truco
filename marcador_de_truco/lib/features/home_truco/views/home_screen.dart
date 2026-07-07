import 'package:flutter/material.dart';
import 'package:marcador_de_truco/core/fonts/customFonts.dart';
import 'package:marcador_de_truco/core/theme/theme_colors.dart';
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
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: ThemeColors.myThemeApp.colorScheme.primary,
              margin: EdgeInsets.zero,
              width: CustomMediaquery.width(context),
              height: CustomMediaquery.heightPorcentage(context, 100),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Time A",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        fontSize: Customfonts.timeNameStyle.fontSize,
                      ),
                    ),

                    Text(
                      "02",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: Customfonts.pointsStyle.fontSize,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                          ),
                          child: Text(
                            "-1", //
                            style: TextStyle(
                              color: TextTheme.of(context).bodyLarge?.color,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                          ),
                          child: Text(
                            "+1",
                            style: TextStyle(
                              color: TextTheme.of(context).bodyLarge?.color,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: ThemeColors.myThemeApp.colorScheme.secondary,
              margin: EdgeInsets.zero,
              width: CustomMediaquery.width(context),
              height: CustomMediaquery.heightPorcentage(context, 100),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Time B",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        fontSize: Customfonts.timeNameStyle.fontSize,
                      ),
                    ),
                    Text(
                      "07",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: Customfonts.pointsStyle.fontSize,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                          ),
                          child: Text(
                            "-1", //
                            style: TextStyle(
                              color: TextTheme.of(context).bodyLarge?.color,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                          ),
                          child: Text(
                            "+1",
                            style: TextStyle(
                              color: TextTheme.of(context).bodyLarge?.color,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
