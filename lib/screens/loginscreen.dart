import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/auth/auth.dart';
import 'package:smart_shopping_assistant/services/background/bg.dart';
import 'package:smart_shopping_assistant/services/reuse/buttons.dart';
import 'package:smart_shopping_assistant/services/reuse/textfield.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Background(
      column: Column(
        children: [
          Image(image: AssetImage("./assets/logo.png")),
          textfield(
            reusetexteditincontroller: _email,
            text: "Enter Your email",
            icon: Icon(Icons.email),
            password: false,
          ),
          SizedBox(height: height * 0.02),
          textfield(
            reusetexteditincontroller: _password,
            text: "Enter Your Password",
            icon: Icon(Icons.lock),
            password: true,
          ),
          SizedBox(height: height * 0.02),
          functionbutton(text: "Log In", function: _login),
        ],
      ),
    );
  }

  Future<void> _login() async {
    final user = await AuthService().loginUserWithEmailAndPassword(
      _email.text,
      _password.text,
    );
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
