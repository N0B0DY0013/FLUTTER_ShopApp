import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import '../models/product.dart';

//import '../widgets/product_item.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import '../widgets/drawer.dart';

import '../providers/cart.dart';

import 'cart_screen.dart';

enum productView { showFavorite, showAll }

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop App"),
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            //itemBuilder: () {},
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: productView.showFavorite,
                  child: Text("Show Favorites"),
                ),
                PopupMenuItem(
                  value: productView.showAll,
                  child: Text("Show All"),
                ),
              ];
            },
            onSelected: (selected) {
              //print(selected);
              setState(() {
                if (selected == productView.showFavorite) {
                  isFavorite = true;
                } else {
                  isFavorite = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            builder: (_, cart, _2) {
              return cart.cartCount == 0
                  ? IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                    )
                  : MyBadge(
                      value: cart.cartCount.toString(),
                      child: IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        },
                      ),
                    );
            },
          ),
        ],
      ),
      body: ProductGrid(
        isFavorite: isFavorite,
      ),
      drawer: const AppDrawer(),
    );
  }
}
