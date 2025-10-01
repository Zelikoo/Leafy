import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../class/produit.dart';
import '../components/my_bottom_nav.dart';

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
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xfffaf2e4),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
          Expanded(
            flex: 9,
            child: GridView.builder(
              itemCount: flowerList.length,
              padding: EdgeInsets.all(5.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(flowerList[index].urlImg, height: 200),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        flowerList[index].name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                      child: Text(
                        "DE ${flowerList[index].price} €",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          MyBottomNav(),
        ],
      ),
    );
  }
}
