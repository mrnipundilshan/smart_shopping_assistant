import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/services/background/bg.dart';
import 'package:smart_shopping_assistant/services/reuse/buttons.dart';

class firstscreen extends StatefulWidget {
  const firstscreen({super.key});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Background(
      column: Column(
        children: [
          Image(image: AssetImage("./assets/logo.png")),

          functionbutton(text: "Sign Up", function: _signup),
          SizedBox(height: height * 0.02),
          functionbutton(text: "Log In", function: _login),
        ],
      ),
    );
  }

  void _signup() {
    Navigator.pushNamed(context, '/welcome');
  }

  void _login() {
    Navigator.pushNamed(context, '/login');
  }
}
