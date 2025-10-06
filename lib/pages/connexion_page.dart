import 'package:flutter/material.dart';

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'logo',
            child: Image(
              image: AssetImage("assets/images/leafy.png"),
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
