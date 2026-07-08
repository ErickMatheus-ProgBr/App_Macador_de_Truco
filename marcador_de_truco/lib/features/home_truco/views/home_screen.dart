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
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text("Paleta de cores"),
              decoration: BoxDecoration(color: Colors.white),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),

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
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                            minimumSize: const Size(40, 10),
                            elevation: 8,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: Text(
                            "+1", //
                            style: TextStyle(
                              color: TextTheme.of(context).bodyLarge?.color,
                              fontSize: 24,
                            ),
                          ),
                        ),

                        SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                            elevation: 8,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: Text(
                            "-1",
                            style: TextStyle(
                              color: TextTheme.of(context).bodyLarge?.color,
                              fontSize: 24,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                            minimumSize: const Size(40, 10),
                            elevation: 8,
                            shadowColor: const Color(0xFF727272),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: Text(
                            "+1", //
                            style: TextStyle(
                              color: TextTheme.of(context).bodyLarge?.color,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(83, 219, 217, 217),
                            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                            minimumSize: const Size(40, 10),
                            elevation: 8,
                            shadowColor: const Color(0xFF727272),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: Text(
                            "-1",
                            style: TextStyle(
                              color: TextTheme.of(context).bodyLarge?.color,
                              fontSize: 24,
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
          // Stack(
          //   children: [
          //     ElevatedButton(onPressed: (){},
          //     child: Text("Trucoooo!")),
          //   ],
          // )
        ],
      ),
    );
  }
}
