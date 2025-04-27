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
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

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
          SizedBox(height: height * 0.01),

          //show error message if exits
          if (_errorMessage != null)
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.02),
              child: Text(
                _errorMessage!,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          functionbutton(
            text: "Log In",
            function: _login,
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      setState(() {
        _errorMessage = "Fill all fields!";
      });
    } else if (AuthService().isValidEmail(_email.text)) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      final user = await AuthService().loginUserWithEmailAndPassword(
        _email.text,
        _password.text,
      );
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _errorMessage = "Enter valid E mail!";
      });
    }
  }
}
