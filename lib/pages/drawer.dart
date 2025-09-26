import 'package:flutter/material.dart';

import 'entretien.dart';
import 'home_page.dart';

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
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.water_drop),
            title: const Text("Bien entretenir ces plantes d'intérieur"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EntretienPage()),
              );
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
