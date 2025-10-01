import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:flutter_leafy/pages/entretien.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leafy',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/entretien': (context) => const EntretienPage(),
      },
      theme: ThemeData(),
    );
  }
}
