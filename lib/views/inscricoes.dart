import 'package:flutter/material.dart';

class Inscricoes extends StatelessWidget {
  const Inscricoes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
          "Inscrições",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
