import 'package:flutter/material.dart';

import '../components/my_drawer.dart';

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
          child: Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pour bien entretenir tes plantes d’intérieur, il faut surtout observer leurs besoins (chaque plante est un peu différente), mais voici les bases :",
                  ),
                  SizedBox(height: 15),
                  Text("🌱 Lumière"),

                  Text(
                    "• La plupart des plantes aiment une lumière vive mais indirecte (près d’une fenêtre orientée est ou ouest).",
                  ),

                  Text(
                    "• Évite le soleil direct trop fort (surtout l’été), sauf pour les plantes qui le supportent (cactus, succulentes).",
                  ),

                  Text(
                    "• Tourne ton pot régulièrement pour que la plante pousse droit.",
                  ),
                  SizedBox(height: 15),
                  Text("💧 Arrosage"),
                  Text(
                    "• Arrose seulement quand la terre est sèche sur 2-3 cm (teste avec ton doigt).",
                  ),
                  Text(
                    "• Vide toujours l’eau stagnante dans la soucoupe, ça évite le pourrissement des racines.",
                  ),
                  Text(
                    "• Utilise de préférence de l’eau à température ambiante, non calcaire si possible.",
                  ),
                  SizedBox(height: 15),
                  Text("🌬️ Humidité & Air"),
                  Text(
                    "• Beaucoup de plantes tropicales aiment une atmosphère un peu humide : vaporise légèrement les feuilles ou place un récipient d’eau à proximité.",
                  ),
                  Text(
                    "• Évite les courants d’air froid ou la chaleur directe d’un radiateur.",
                  ),
                  SizedBox(height: 15),
                  Text("🌿 Entretien régulier"),
                  Text(
                    "• Nettoie les feuilles (chiffon humide) pour enlever la poussière, ça aide à la photosynthèse.",
                  ),
                  Text(
                    "• Supprime les feuilles jaunes ou mortes pour stimuler la croissance.",
                  ),
                  Text(
                    "• Rempote tous les 1 à 2 ans, quand les racines sortent du pot.",
                  ),
                  SizedBox(height: 15),
                  Text("🌸 Nutrition"),
                  Text(
                    "• Mets un peu d’engrais liquide (adapté aux plantes vertes ou fleuries) tous les 15 jours au printemps et en été.",
                  ),
                  Text(
                    "• Stoppe ou réduis les apports en automne et hiver, période de repos pour la plupart des plantes.",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
