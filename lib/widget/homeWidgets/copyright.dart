import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth;
    if (kIsWeb) {
      screenWidth = MediaQuery.of(context).size.width - 300.0;
    } else {
      screenWidth = MediaQuery.of(context).size.width - 20;
    }
    return Card(
      elevation: 8.0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 60.0,
        width: screenWidth,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: const Center(
          child: Text(
            "@ Copyright 2024 All rights reserved | Build by Kyan",
            style: TextStyle(
              letterSpacing: 1.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
