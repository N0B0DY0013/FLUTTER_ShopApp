import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _cart_list = {};

  Map<String, CartItem> get cart_list {
    return {..._cart_list};
  }

  int get cartCount {
    return _cart_list.length;
  }

  double get cartTotal {
    double total_amount = 0.0;

    cart_list.forEach((key, value) {
      total_amount += value.price * value.quantity;
    });

    return total_amount;
  }

  int productCartCount(String productId) {
    if (_cart_list.containsKey(productId)) {
      return _cart_list[productId]!.quantity;
    }
    return 0;
  }

  void addCartItem(String productId, String title, double price,
      [int quantity = 1]) {
    if (_cart_list.containsKey(productId)) {
      _cart_list.update(
          productId,
          (existing) => CartItem(
                id: existing.id,
                price: existing.price,
                title: existing.title,
                quantity: existing.quantity + 1,
              ));
    } else {
      _cart_list.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: quantity,
              price: price));
    }

    notifyListeners();
  }

  void updateCartItemQty(String cartId, int qty) {
    if (_cart_list.containsKey(cartId)) {
      _cart_list.update(
          cartId,
          (existing) => CartItem(
                id: existing.id,
                price: existing.price,
                title: existing.title,
                quantity: qty,
              ));
    }

    notifyListeners();
  }

  void deleteCartItem(String cartId) {
    if (_cart_list.containsKey(cartId)) {
      _cart_list.remove(cartId);
    }

    notifyListeners();
  }

  void clearCart() {
    _cart_list = {};

    notifyListeners();
  }
}
