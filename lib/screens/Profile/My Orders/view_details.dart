import 'package:flutter/material.dart';
import 'package:my_first_project/screens/Profile/My Orders/order_model.dart'; // Import the Order class

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        title: Text('Order Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30.0),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Graph preview
            Container(
              margin: const EdgeInsets.all(16.0),
              height: 200,
              color: Colors.grey[300],
              child: Center(
                child: Text('Graph Preview: Seller to Receiver Progress'),
              ),
            ),
            // Estimated time
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Estimated Time: 3-5 Business Days',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            // Product details
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Details:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset('images/men fashion/shert.png', width: 100, height: 100),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Product Name: Shirt'),
                            Text('Price: \$25.99'),
                            Text('Size: M'),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow, size: 20),
                                Text('4.5'),
                              ],
                            ),
                            Text('Reviews: 120'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Similar products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Similar Products:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductCard(imagePath: 'images/men fashion/pants.png'),
                  ProductCard(imagePath: 'images/men fashion/man jacket.png'),
                  ProductCard(imagePath: 'images/women fashion/t-shert.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;

  const ProductCard({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
          const SizedBox(height: 4),
          Text('Product Name'),
          Text('Price: \$30.00'),
        ],
      ),
    );
  }
}
