import 'package:flutter/material.dart';

class CartTiles extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  const CartTiles({
    super.key,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
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
          subtitle: Text("\$ ${(quantity * price)}"),
          trailing: Text(
            "$quantity x",
            style:  TextStyle(
              fontSize: 18,
              color: Colors.orange[800]
            ),
          ),
        ),
      ),
    );
  }
}
