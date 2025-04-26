import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/screens/welcomeScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/welcome': (context) => const WelcomeScreen()},
      home: WelcomeScreen(),
    );
  }
}
