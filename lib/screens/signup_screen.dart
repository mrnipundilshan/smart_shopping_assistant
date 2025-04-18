import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smart_shopping_assistant/services/background/bg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool loading = false;

  Future<void> signUp() async {
    setState(() => loading = true);

    try {
      // Firebase signup
      UserCredential userCred =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Send user data to backend
      final response = await http.post(
        Uri.parse(
          'http://10.0.2.2:5000/api/register',
        ), // Use localhost for emulator
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text.trim(),
          'is_verified': false,
        }),
      );

      print("Backend response: ${response.body}");

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Sign up successful!")));
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/logo.png')),
          Text(
            "Your Interlligent shopping assistant create lists, share items, and always remember what you need!",
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          loading
              ? CircularProgressIndicator()
              : ElevatedButton(onPressed: signUp, child: Text("Sign Up")),
        ],
      ),
    ));
  }
}
