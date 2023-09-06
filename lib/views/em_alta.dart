import 'package:flutter/material.dart';

class EmAlta extends StatelessWidget {
  const EmAlta({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          "Em alta",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
