import 'package:flutter/material.dart';

class textfield extends StatefulWidget {
  final TextEditingController reusetexteditincontroller;
  final String text;
  final Icon icon;
  final bool password;

  const textfield({
    super.key,
    required this.reusetexteditincontroller,
    required this.text,
    required this.icon,
    required this.password,
  });

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.8,
      child: TextField(
        controller: widget.reusetexteditincontroller,
        obscureText: widget.password ? _obscureText : false,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          filled: true,
          fillColor: Colors.green[50],
          iconColor: Color(0xFF062920),
          hintStyle: TextStyle(color: Color(0xFF062920)),
          hintText: widget.text,
          suffixIcon:
              widget.password
                  ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xFF062920),
                    ),
                  )
                  : null,
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
