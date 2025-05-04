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
    return Background(
      column: Column(
        children: [functionbutton(text: "Sign Out", function: _logout)],
      ),
    );
  }

  Future<void> _logout() async {
    AuthService().signout().then((value) {
      Navigator.pushReplacementNamed(context, '/first');
    });
  }
}
