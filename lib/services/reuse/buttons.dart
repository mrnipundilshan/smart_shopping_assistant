import 'package:flutter/material.dart';

class functionbutton extends StatelessWidget {
  final String text;
  final Function function;
  final bool isLoading;

  const functionbutton({
    super.key,
    required this.text,
    required this.function,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return AbsorbPointer(
      absorbing: isLoading,
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,

          minimumSize: Size(width * 0.7, height * 0.08),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
        ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child:
              isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
                    text,
                    style: TextStyle(
                      fontSize: width * 0.06,
                      color: const Color.fromARGB(255, 43, 57, 26),
                    ),
                  ),
        ),
      ),
    );
  }
}
