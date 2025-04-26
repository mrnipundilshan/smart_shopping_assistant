import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/screens/welcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
