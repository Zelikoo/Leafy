import 'package:flutter/material.dart';
import 'package:flutter_leafy/class/produit.dart';
import '../components/my_appbar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> insertPanier(int quantite, int id_produit, int id_client) async {
  final url = Uri.parse('http://10.0.2.2/leafy/api/insert_panier.php');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},

    body: jsonEncode({
      'quantite': quantite,
      'id_produit': id_produit,
      'id_client': id_client,
    }),
  );

  final data = jsonDecode(response.body);
  if (data['success']) {
    print('Utilisateur inséré avec succès');
  } else {
    print('Erreur : ${data['error']}');
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.produit});

  final Produit produit;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade400, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.produit.name,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: Text(
                  '${widget.produit.price} €',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.pink.shade400,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: Image.asset(
                  widget.produit.urlImg,
                  height: 300,
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade800,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove, color: Colors.white),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: Text(
                        quantity.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  print(quantity);
                  print(widget.produit.id);
                  insertPanier(quantity, widget.produit.id, 1);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart, color: Colors.white),
                    const SizedBox(width: 10),
                    const Text(
                      "Ajouter au panier",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Caractéristiques principales",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
              ),
              const SizedBox(height: 10),
              Text(widget.produit.description),
            ],
          ),
        ),
      ),
    );
  }
}
