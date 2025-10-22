import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../class/produit.dart';
import '../components/my_appbar.dart';
import 'detail_page.dart';
import '../services/networking.dart';

const urlAPI = 'http://10.0.2.2/leafy/api';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Produit> flowerList = [];
  int numCategory = 0;

  Future<void> getFlowerListForCategory(int categoryId) async {
    final url = '$urlAPI/get_plantes.php?id_categorie=$categoryId';
    NetworkHelper networkHelper = NetworkHelper(url);

    var data = await networkHelper.getData();

    if (data != null && data['plantes'] != null) {
      List<dynamic> plantesJson = data['plantes'];

      setState(() {
        flowerList = plantesJson.map((json) => Produit.fromJson(json)).toList();
      });
    } else {
      setState(() {
        flowerList = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getFlowerListForCategory(1);
  }

  List<String> categoryList = [
    "Petite plante",
    "Moyenne plante",
    "Terrarium",
    "Pot / Accessoire",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      appBar: MyAppBar(),

      body: Column(
        children: [
          // Catégories horizontales
          Container(
            height: 70,
            decoration: const BoxDecoration(color: Colors.teal),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        numCategory = index;
                      });
                      getFlowerListForCategory(
                        index + 1,
                      ); // car index 0 = id_categorie 1
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: index == numCategory
                          ? Colors.teal.shade800
                          : Colors.teal.shade400,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      categoryList[index],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(produit: produit),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Image.asset(produit.urlImg, height: 200)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            produit.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1, // empêche le texte de dépasser
                            overflow: TextOverflow
                                .ellipsis, // ajoute "..." si trop long
                            textAlign: TextAlign.start,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                          child: Text(
                            "${produit.price} €",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
