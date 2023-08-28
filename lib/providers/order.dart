import 'package:flutter/material.dart';

import '../models/order_item.dart';
import '../models/cart_item.dart';

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  int get orderCount {
    return _orders.length;
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        timeStamp: DateTime.now(),
      ),
    );

    notifyListeners();
  }

}
