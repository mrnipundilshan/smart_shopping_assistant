import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/auth/auth.dart';
import 'package:smart_shopping_assistant/services/background/bg.dart';
import 'package:smart_shopping_assistant/services/reuse/buttons.dart';
import 'package:smart_shopping_assistant/services/reuse/square_tile.dart';
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
  String? _errorMessage;

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
          Image(image: AssetImage("./assets/logo.png"), width: height * 0.4),
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
          SizedBox(height: height * 0.01),
          functionbutton(
            text: "Sign Up",
            function: _signup,
            isLoading: _isLoading,
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(
                onTap: () async {
                  final user = await AuthService().signWithGoogle();
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    setState(() {
                      _errorMessage =
                          "Google Sign-In failed. Please try again.";
                    });
                  }
                },
                imagePath: "assets/google.png",
              ),
              SizedBox(width: height * 0.01),
              SquareTile(
                onTap: () async {
                  final user = await AuthService().signWithApple();
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    setState(() {
                      _errorMessage =
                          "Google Sign-In failed. Please try again.";
                    });
                  }
                },
                imagePath: "assets/apple.png",
              ),
            ],
          ),

          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account? ",
                style: TextStyle(color: Colors.white),
              ),
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/login'),
                child: const Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _signup() async {
    if (_email.text.isEmpty ||
        _password.text.isEmpty ||
        _confirmp.text.isEmpty) {
      setState(() {
        _errorMessage = "Fill all fields!";
      });

      return;
    } else if (AuthService().isValidEmail(_email.text)) {
      if (_password.text == _confirmp.text) {
        setState(() {
          _isLoading = true;
          _errorMessage = null;
        });

        try {
          final user = await AuthService().createUserWithEmailAndPassword(
            _email.text,
            _password.text,
          );
          if (user != null) {
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            setState(() {
              _errorMessage = "Signup failed. Please try again.";
            });
          }
        } on FirebaseAuthException catch (e) {
          setState(() {
            if (e.code == 'weak-password') {
              _errorMessage = "Password must be at least 6 characters";
            } else if (e.code == 'email-already-in-use') {
              _errorMessage = "Email already in use. Try logging in";
            } else if (e.code == 'invalid-email') {
              _errorMessage = "Invalid email address";
            } else {
              _errorMessage = "Signup error: ${e.message}";
            }
          });
        } catch (e) {
          setState(() {
            _errorMessage = "An unexpected error occurred. Try again.";
          });
        }

        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = "Passwords do not match!";
        });
        return;
      }
    } else {
      setState(() {
        _errorMessage = "Enter valid E mail!!";
      });

      return;
    }
  }
}
