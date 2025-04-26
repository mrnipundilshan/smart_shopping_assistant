import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  final TextEditingController reusetexteditincontroller;
  final String text;
  final Icon icon;

  const textfield({
    super.key,
    required this.reusetexteditincontroller,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.8,
      child: TextField(
        controller: reusetexteditincontroller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.green[50],
          iconColor: Color(0xFF062920),
          hintStyle: TextStyle(color: Color(0xFF062920)),
          hintText: text,
          suffixIcon: icon,
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: const Color(0xFF062920), width: 2),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
