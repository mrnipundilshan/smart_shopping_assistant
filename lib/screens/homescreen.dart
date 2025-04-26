import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/services/background/bg.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Background(column: Column(children: [Text("Logged")]));
  }
}
