import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/auth/auth.dart';
import 'package:smart_shopping_assistant/services/background/bg.dart';
import 'package:smart_shopping_assistant/services/reuse/buttons.dart';
import 'package:smart_shopping_assistant/services/reuse/textfield.dart';

class signinscreen extends StatefulWidget {
  const signinscreen({super.key});

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmp = TextEditingController();
  bool _isLoading = false;

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
          textfield(
            reusetexteditincontroller: _confirmp,
            text: "Confirm Your Password",
            icon: Icon(Icons.lock),
            password: true,
          ),
          SizedBox(height: height * 0.025),

          functionbutton(
            text: "Sign Up",
            function: _signup,
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }

  Future<void> _signup() async {
    setState(() {
      _isLoading = true;
    });

    if (_password.text == _confirmp.text) {
      final user = await AuthService().createUserWithEmailAndPassword(
        _email.text,
        _password.text,
      );
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
    setState(() {
      _isLoading = false;
    });
  }
}
