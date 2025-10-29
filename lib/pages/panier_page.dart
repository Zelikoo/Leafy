import 'package:flutter/material.dart';
import 'package:flutter_leafy/components/my_appbar.dart';
import 'package:flutter_leafy/class/produit.dart';
import 'package:flutter_leafy/services/networking.dart';

const urlAPI = 'http://10.0.2.2/leafy/api';

class PanierPage extends StatefulWidget {
  const PanierPage({super.key});

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  List<dynamic> panier = [];
  NetworkHelper networkHelper = NetworkHelper('$urlAPI/panier.php');

  Future<void> getPanier() async {
    try {
      var panierData = await networkHelper.getData();
      setState(() {
        panier = panierData; // on garde le JSON brut
      });
    } catch (e) {
      print("Erreur lors du chargement du panier : $e");
    }
  }

  double get total {
    double total = 0;
    for (var item in panier) {
      var produit = item['panier'];
      double prix = double.tryParse(produit['prix'].toString()) ?? 0;
      int quantite = int.tryParse(item['quantite'].toString()) ?? 0;
      total += prix * quantite;
    }
    return total;
  }

  final rightDeleteIcon = Container(
    color: Colors.red,
    child: const Icon(
      Icons.delete,
      color: Colors.white,
      size: 40,
      textDirection: TextDirection.ltr,
    ),
  );

  @override
  void initState() {
    super.initState();
    getPanier();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Mon Panier :",
              style: TextStyle(fontSize: 30, color: Colors.teal),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: panier.isEmpty
                  ? const Center(
                      child: Text(
                        "Votre panier est vide.",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: panier.length,
                      itemBuilder: (context, index) {
                        var item = panier[index];
                        var produitJson = item['panier'];
                        var produit = Produit.fromJson(produitJson);
                        int quantite = item['quantite'];

                        return Column(
                          children: [
                            articlePanier(quantite, produit, index),
                            const Divider(),
                          ],
                        );
                      },
                    ),
            ),
            const SizedBox(height: 20),
            if (panier.isNotEmpty) ...[
              Center(
                child: Text(
                  "Total : ${total.toStringAsFixed(2)} €",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print("Commande envoyée");
                    // TODO: Envoyer commande à ton backend
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Commander",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget articlePanier(int quantite, Produit produit, int index) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: rightDeleteIcon,
      onDismissed: (direction) {
        setState(() {
          panier.removeAt(index);
        });
      },
      child: Container(
        color: Colors.grey.shade100,
        height: 150,
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image du produit
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: produit.urlImg.startsWith('http')
                  ? Image.network(
                      produit.urlImg,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      produit.urlImg,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(width: 20),

            // Détails du produit
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    produit.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text("${produit.price} €"),
                  const SizedBox(height: 5),
                  Text("Quantité : $quantite"),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        panier.removeAt(index);
                      });
                      networkHelper.deleteProduitPanier(produit.id);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.black26),
                      ),
                    ),
                    child: const Text(
                      "Supprimer",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
