import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/my_appbar.dart';

class EntretienPage extends StatelessWidget {
  const EntretienPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaf2e4),
      drawer: MyDrawer(),
      appBar: My_AppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pour bien entretenir tes plantes d’intérieur, il faut surtout observer leurs besoins (chaque plante est un peu différente), mais voici les bases :",
              ),
              SizedBox(height: 15),
              Text("🌱 Lumière", style: TextStyle(fontWeight: FontWeight.bold)),

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
              Text(
                "💧 Arrosage",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
              Text(
                "🌬️ Humidité & Air",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "• Beaucoup de plantes tropicales aiment une atmosphère un peu humide : vaporise légèrement les feuilles ou place un récipient d’eau à proximité.",
              ),
              Text(
                "• Évite les courants d’air froid ou la chaleur directe d’un radiateur.",
              ),
              SizedBox(height: 15),
              Text(
                "🌿 Entretien régulier",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
              Text(
                "🌸 Nutrition",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
    );
  }
}
