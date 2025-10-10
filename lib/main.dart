import 'package:flutter/material.dart';
import 'package:flutter_leafy/main_page.dart';
import 'pages/home_page.dart';
import 'pages/entretien_page.dart';
import 'pages/profil_page.dart';
import 'pages/panier_page.dart';
import 'pages/connexion_page.dart';

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
        '/': (context) => const MainPage(),
        '/home': (context) => const HomePage(),
        '/entretien': (context) => const EntretienPage(),
        '/panier': (context) => const PanierPage(),
        '/profil': (context) => const ProfilPage(),
        '/connexion': (context) => const ConnexionPage(),
      },
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
