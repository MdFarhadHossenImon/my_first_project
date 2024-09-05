import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get cart => _cart;

  void toogleFavorite(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  // Increment quantity of a product
  void incrementQtn(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart[index].quantity++;
      notifyListeners();
    }
  }

  // Decrement quantity of a product
  void decrementQtn(int index) {
    if (index >= 0 && index < _cart.length) {
      if (_cart[index].quantity <= 1) {
        return;
      }
      _cart[index].quantity--;
      notifyListeners();
    }
  }

  // Remove a product from the cart by index
  void removeFromCart(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart.removeAt(index);
      notifyListeners();
    }
  }

  // Calculate total price
  double totalPrice() {
    double myTotal = 0.0;
    for (Product element in _cart) {
      myTotal += element.price * element.quantity;
    }
    return myTotal;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
