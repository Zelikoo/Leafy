import 'package:flutter/material.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Panier',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
      selectedItemColor: Colors.teal.shade800,
      unselectedItemColor: Colors.grey,
      iconSize: 30,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/panier');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/profil');
        }
      },
    );
  }
}
