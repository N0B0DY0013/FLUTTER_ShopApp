import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/cart.dart';

import '../screens/product_detail_screen.dart';

import '../widgets/badge.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  const ProductItem({
    super.key,
    // required this.id,
    // required this.title,
    // required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    
    final product = Provider.of<Product>(context); //Provider -> Class-wide data management way ...
    //final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black54,
            leading: Consumer<Product>(
              //Consumer -> isolated data management way ...
              builder: (ctx, prod, _) {
                return IconButton(
                  icon: Icon(
                    prod.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: prod.isFavorite ? Colors.orange : Colors.white,
                  ),
                  onPressed: () {
                    prod.toggleIsFavorite();
                  },
                );
              },
            ),
            // trailing: IconButton(
            //   icon: const Icon(
            //     Icons.shopping_cart,
            //   ),
            //   onPressed: () {

            //     cart.addCartItem(product.id, product.title, product.price);

            //   },
            // )
            trailing: Consumer<Cart>(
              builder: (ctx, cart, _) {
                return cart.productCartCount(product.id) == 0
                    ? IconButton(
                        onPressed: () {
                          cart.addCartItem(
                            product.id,
                            product.title,
                            product.price,
                          );
                        },
                        icon: const Icon(Icons.shopping_cart),
                      )
                    : MyBadge(
                        value: cart.productCartCount(product.id).toString(),
                        color: Colors.orange,
                        child: IconButton(
                          icon: const Icon(
                            Icons.shopping_cart,
                          ),
                          onPressed: () {
                            cart.addCartItem(
                              product.id,
                              product.title,
                              product.price,
                            );
                          },
                        ),
                      );
              },
            )),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            //   return ProductDetailScreen(title: title);
            // }));
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
