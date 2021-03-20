import 'package:flutter/material.dart';
import 'package:theme_mode_builder/theme_mode_builder.dart';

class ThemeModeBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeModeBuilder(
      builder: (
        BuildContext context,
        ThemeMode themeMode,
      ) {
        return MaterialApp(
          themeMode: themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
          ),
          home: Home(),
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Theme Mode Builder Example",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Current Mode: ${ThemeModeBuilderConfig.isDarkTheme() ? "Dark" : "Light"}",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                "Toggle Mode",
              ),
              onPressed: () async {
                await ThemeModeBuilderConfig.toggleTheme();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  icon: Icon(Icons.lightbulb),
                  label: Text(
                    "Light Mode",
                  ),
                  onPressed: ThemeModeBuilderConfig.isDarkTheme()
                      ? () async {
                          await ThemeModeBuilderConfig.toggleTheme();
                        }
                      : () {},
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.lightbulb_outline),
                  label: Text(
                    "Dark Mode",
                  ),
                  onPressed: ThemeModeBuilderConfig.isDarkTheme()
                      ? () {}
                      : () async {
                          await ThemeModeBuilderConfig.toggleTheme();
                        },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
