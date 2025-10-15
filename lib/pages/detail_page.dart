import 'package:flutter/material.dart';
import 'package:flutter_leafy/class/produit.dart';
import '../components/my_appbar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.produit});

  final Produit produit;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1; // ✅ On la place ici, au niveau de l'état

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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
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
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sollicitudin justo sit amet enim porta, eget aliquet leo aliquam. Phasellus tincidunt, eros a ornare sagittis, ante sem facilisis velit, facilisis ultricies lacus nisl sed orci. Vivamus quis est vitae dui dignissim scelerisque nec sed nunc. Curabitur fermentum, augue id sollicitudin maximus, lorem lectus luctus eros, eu ultricies mauris arcu nec est. Pellentesque sit amet egestas turpis, sed rutrum velit. Maecenas rhoncus, arcu et bibendum euismod, ipsum lacus congue sem, eget ornare arcu ex non ex. Cras ut purus vehicula, viverra risus a, faucibus massa. Sed eu lectus at nisl rutrum blandit. Nunc sed leo at velit fringilla dictum. Praesent sed molestie massa, eget tincidunt arcu. Suspendisse enim felis, euismod a lorem quis, volutpat mollis justo. Fusce vulputate dolor ut quam dignissim faucibus.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
