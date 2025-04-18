import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.0, 0.0), // center of the screen
                radius: 0.7,
                colors: [
                  Color(0xFF175C3B).withOpacity(0.6), // inner green glow
                  Color(0xFF062920), // dark outer green
                ],
                stops: [0.0, 1],
              ),
            )),

        // Your child content
        child,
      ],
    );
  }
}
