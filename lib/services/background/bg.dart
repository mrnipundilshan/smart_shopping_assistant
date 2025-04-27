import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget column;

  const Background({super.key, required this.column});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, 0.0),
            radius: 0.7,
            colors: [
              Color.fromARGB(235, 23, 92, 59), // inner green glow
              Color(0xFF062920), // dark outer green
            ],
            stops: [0.0, 1],
          ),
        ),
        child: Center(child: SingleChildScrollView(child: column)),
      ),
    );
  }
}
