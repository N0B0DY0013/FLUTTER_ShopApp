import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

import 'cart_qty_update.dart';

class CartTiles extends StatelessWidget {
  final String CartKey;
  final String CartItemId;
  final double price;
  final int quantity;
  final String title;

  const CartTiles({
    super.key,
    required this.CartKey,
    required this.CartItemId,
    required this.price,
    required this.quantity,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(CartItemId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.grey[300],
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          size: 35,
          color: Colors.orange[900],
        ),
      ),
      onDismissed: (direction) {
        //print(id);
        Provider.of<Cart>(context, listen: false).deleteCartItem(CartKey);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: FittedBox(
                      child: Text(
                        "\$ $price",
                      ),
                    ),
                  ),
                ),
                title: Text(title),
                subtitle: Text("\$ ${(quantity * price).toStringAsFixed(2)}"),
                trailing: Text(
                  "$quantity x",
                  style: TextStyle(fontSize: 18, color: Colors.orange[800]),
                ),
              ),
              CartQtyUpdate(
                cartKey: CartKey,
                quantity: quantity,
                price:  price,
                title: title,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
