import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/services/background/bg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Background(
      column: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: _email),
          TextField(controller: _password),
          ElevatedButton(onPressed: () {}, child: Text("data")),
        ],
      ),
    );
  }
}
