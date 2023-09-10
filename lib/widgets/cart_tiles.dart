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
  final String imageUrl;

  const CartTiles({
    super.key,
    required this.CartKey,
    required this.CartItemId,
    required this.price,
    required this.quantity,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(CartItemId),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Are you sure?"),
              content:
                  const Text("Do you want to remove the item from the Cart?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          },
        );
      },
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
                leading: Column(
                  children: [
                    CircleAvatar(
                      // backgroundColor: Colors.black87,
                      // foregroundColor: Colors.white,
                      backgroundImage: NetworkImage(imageUrl),
                      // child: Padding(
                      //   padding: const EdgeInsets.all(5),
                      //   child: FittedBox(
                      //     child: Text(
                      //       "\$ $price",
                      //     ),
                      //   ),
                      // ),
                    ),
                    Text(
                      "\$ ${price.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                title: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
                subtitle: Container(
                  margin: const EdgeInsets.only(
                    top: 2,
                  ),
                  child: Text(
                    "\$ ${(quantity * price).toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange[800],
                        fontWeight: FontWeight.bold),
                  ),
                ),
                trailing: Text(
                  "$quantity x",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CartQtyUpdate(
                cartKey: CartKey,
                quantity: quantity,
                price: price,
                title: title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
