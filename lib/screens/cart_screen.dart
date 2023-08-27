import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

import '../widgets/cart_tiles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Spacer(),
                  Consumer<Cart>(
                    builder: (_, cart, _2) {
                      return Chip(
                        backgroundColor: Colors.black87,
                        label: Text(
                          "\$ ${cart.cartTotal}",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Checkout"),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<Cart>(
              builder: (_, cart, _2) {
                return ListView.builder(
                  //scrollDirection: Axis.vertical,
                  //shrinkWrap: true,
                  itemCount: cart.cartCount,
                  itemBuilder: (ctx, i) {
                    return CartTiles(
                      id: cart.cart_list.values.elementAt(i).id,
                      price: cart.cart_list.values.elementAt(i).price,
                      quantity: cart.cart_list.values.elementAt(i).quantity,
                      title: cart.cart_list.values.elementAt(i).title,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
