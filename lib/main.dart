import 'package:flutter/material.dart';
import 'package:movieapp/src/view/home_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromRGBO(86, 80, 14, 171),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color.fromRGBO(86, 80, 14, 171),
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
