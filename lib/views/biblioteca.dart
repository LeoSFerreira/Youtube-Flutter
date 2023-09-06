import 'package:flutter/material.dart';

class Biblioteca extends StatelessWidget {
  const Biblioteca({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          "Biblioteca",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
