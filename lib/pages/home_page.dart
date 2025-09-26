import 'package:flutter/material.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List flowerList = ["bonsai", "daisy", "rose", "tulip"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        margin: EdgeInsets.only(top: 10.0),
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
                Image.asset("assets/images/bonsai.jpg"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    flowerList[index],
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
                    "DE 20,00 €",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
