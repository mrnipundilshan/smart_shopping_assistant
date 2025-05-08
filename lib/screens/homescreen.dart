import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/auth/auth.dart';
import 'package:smart_shopping_assistant/services/background/bg.dart';
import 'package:smart_shopping_assistant/services/reuse/buttons.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Background(
      column: Column(
        children: [
          Text(
            FirebaseAuth.instance.currentUser!.email ?? 'No email available',
            style: TextStyle(
              fontSize: width * 0.06,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(height: height * 0.01),
          functionbutton(text: "Sign Out", function: _logout),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    AuthService().signout().then((value) {
      Navigator.pushReplacementNamed(context, '/first');
    });
  }
}
