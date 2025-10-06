import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../class/produit.dart';
import '../components/my_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Produit> flowerList = [
    Produit(
      urlImg: "assets/images/bonsai.jpg",
      name: "Bonsai",
      price: 20.0,
      description: "Petite plante",
    ),
    Produit(
      urlImg: "assets/images/daisy.jpg",
      name: "Daisy",
      price: 15.0,
      description: "Petite plante",
    ),
    Produit(
      urlImg: "assets/images/rose.jpg",
      name: "Rose",
      price: 10.0,
      description: "Petite plante",
    ),
    Produit(
      urlImg: "assets/images/tulip.jpg",
      name: "Tulip",
      price: 15.0,
      description: "Petite plante",
    ),
  ];

  List<String> categoryList = [
    "Petite plante",
    "Moyenne plante",
    "Terrarium",
    "Pot / Accessoire",
  ];

  int numCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      appBar: My_AppBar(),

      body: Column(
        children: [
          // Catégories horizontales
          SizedBox(
            height: 70,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 0.5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        numCategory = index;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: index == numCategory
                          ? Colors.teal.shade800
                          : Colors.teal.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(categoryList[index]),
                  );
                },
              ),
            ),
          ),

          // Liste de produits
          Expanded(
            child: GridView.builder(
              itemCount: flowerList.length,
              padding: const EdgeInsets.all(5.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemBuilder: (context, index) {
                final produit = flowerList[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(produit.urlImg, height: 200),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        produit.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                      child: Text(
                        "DE ${produit.price} €",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
