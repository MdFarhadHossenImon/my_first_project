import 'package:flutter/material.dart';
import '../../../constants.dart'; // Make sure this import is correct

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  bool isGridView = true;

  final List<Map<String, dynamic>> products = [
    {
      "image": "images/men fashion/shert.png",
      "name": "Men Shirt",
      "price": "\$60.00"
    },
    {
      "image": "images/men fashion/pants.png",
      "name": "Men Pants",
      "price": "\$85.00"
    },
    {
      "image": "images/men fashion/man jacket.png",
      "name": "Man Jacket",
      "price": "\$250.00"
    },
    {
      "image": "images/men fashion/watch.png",
      "name": "Watch",
      "price": "\$120.00"
    },
    {
      "image": "images/women fashion/t-shert.png",
      "name": "Woman Shirt",
      "price": "\$120.00"
    },
    {
      "image": "images/women fashion/kurta.png",
      "name": "Women Kurta",
      "price": "\$199.00"
    },
    {
      "image": "images/shoes/Air Jordan.png",
      "name": "Sneakers",
      "price": "\$140.00"
    },
    {
      "image": "images/men fashion/watch.png",
      "name": "Smartwatch",
      "price": "\$999.00"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Increase the height here
        child: Center(
          child: AppBar(
            title: const Text("Super Sale Discount"),
              titleTextStyle: const TextStyle( // Change the title text style here
                color: Colors.white, // Set the title text color
                fontSize: 29.0, // Adjust font size if needed
                fontWeight: FontWeight.w400, // Adjust font weight if needed
              ),

            actions: [

              IconButton(
                color: Colors.white,
                iconSize:35 ,
                icon: Icon(isGridView ? Icons.grid_view : Icons.list),
                onPressed: () {
                  setState(() {
                    isGridView = !isGridView;
                  });
                },
              ),
            ],
            backgroundColor: Colors.black.withOpacity(0.8), // Adjust opacity here
          ),
        ),
      ),
      body: isGridView ? buildGridView() : buildListView(),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return buildProductCard(products[index]);
      },
    );
  }

  Widget buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return buildProductCard(products[index]);
      },
    );
  }

  Widget buildProductCard(Map<String, dynamic> product) {
    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              product['image'],
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product['name'],
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product['price'],
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
