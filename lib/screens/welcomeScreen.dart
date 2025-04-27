import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/auth/auth.dart';
import 'package:smart_shopping_assistant/services/background/bg.dart';
import 'package:smart_shopping_assistant/services/reuse/buttons.dart';
import 'package:smart_shopping_assistant/services/reuse/textfield.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmp = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _confirmp.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Background(
      column: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("./assets/logo.png")),
          textfield(
            reusetexteditincontroller: _email,
            text: "Enter Your Email",
            icon: Icon(Icons.email),
          ),
          SizedBox(height: height * 0.02),
          textfield(
            reusetexteditincontroller: _password,
            text: "Enter Your Password",
            icon: Icon(Icons.lock),
          ),
          SizedBox(height: height * 0.02),
          textfield(
            reusetexteditincontroller: _password,
            text: "Confirm Your Password",
            icon: Icon(Icons.lock),
          ),
          SizedBox(height: height * 0.025),
          functionbutton(text: "Sign Up", function: _signup),
        ],
      ),
    );
  }

  Future<void> _signup() async {
    final user = await AuthService().createUserWithEmailAndPassword(
      _email.text,
      _password.text,
    );
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
