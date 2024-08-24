import 'package:flutter/material.dart';
import 'package:flutter_shadcn_ui_playground/home.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This variable holds the current theme mode
  ThemeMode _themeMode = ThemeMode.light;

  // Function to toggle between light and dark mode
  void _toggleTheme() {
    setState(() {
      _themeMode =
      _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShadApp(
      title: 'Flutter Theme Switcher',
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadSlateColorScheme.light(),
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      ),
      themeMode: _themeMode, // Use the current theme mode
      home: MyHomePage(title: 'Shadcn UI controls', toggleTheme: _toggleTheme,),
    );
  }
}


