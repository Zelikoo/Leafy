import 'package:flutter/material.dart';

import '../pages/entretien_page.dart';
import '../pages/home_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xff097782)),
            child: Icon(Icons.local_florist, color: Colors.white, size: 64),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name == '/') {
                return Navigator.pop(context);
              } else {
                Navigator.pushNamed(context, '/');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.water_drop),
            title: const Text("Bien entretenir ces plantes d'intérieur"),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name == '/entretien') {
                return Navigator.pop(context);
              } else {
                Navigator.pushNamed(context, '/entretien');
              }
            },
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          const ListTile(leading: Icon(Icons.info), title: Text("About")),
        ],
      ),
    );
  }
}
