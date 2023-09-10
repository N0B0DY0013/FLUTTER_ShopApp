import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product_list.dart';

import '../providers/cart.dart';
import '../providers/order.dart';
import '../providers/product_list.dart';

import '../widgets/cart_tiles.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({super.key});

  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
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
                          "\$ ${cart.cartTotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      Provider.of<Order>(context, listen: false).addOrder(
                        Provider.of<Cart>(context, listen: false).cart_list.values.toList(),
                        Provider.of<Cart>(context, listen: false).cartTotal,
                      );

                      Provider.of<Cart>(context, listen: false).clearCart();
                    },
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
                      CartKey: cart.cart_list.keys.elementAt(i),
                      CartItemId: cart.cart_list.values.elementAt(i).id,
                      price: cart.cart_list.values.elementAt(i).price,
                      quantity: cart.cart_list.values.elementAt(i).quantity,
                      title: cart.cart_list.values.elementAt(i).title,
                      imageUrl: ProductList().getProductByID(cart.cart_list.keys.elementAt(i)).imageUrl,
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
