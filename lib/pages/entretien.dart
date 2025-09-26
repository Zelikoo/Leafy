import 'package:flutter/material.dart';

import 'drawer.dart';

class EntretienPage extends StatelessWidget {
  const EntretienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaf2e4),
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xfffaf2e4),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage("assets/images/leafy.png"),
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 10),
                Text(
                  "Leafy",
                  style: TextStyle(
                    fontFamily: 'AlexBrush',
                    fontSize: 50,
                    color: Color(0xff097782),
                  ),
                ),
              ],
            ),
            Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 30),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pour bien entretenir tes plantes d’intérieur, il faut surtout observer leurs besoins (chaque plante est un peu différente), mais voici les bases :",
              ),
              Text("🌱 Lumière"),

              ListTile(
                leading: Icon(Icons.water_drop),
                title: Text("Bien entretenir ces plantes d'intérieur"),
              ),
              ListTile(
                leading: Icon(Icons.water_drop),
                title: Text("Bien entretenir ces plantes d'intérieur"),
              ),
              ListTile(
                leading: Icon(Icons.water_drop),
                title: Text("Bien entretenir ces plantes d'intérieur"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
