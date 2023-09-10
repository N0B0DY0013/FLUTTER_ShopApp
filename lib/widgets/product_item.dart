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
    final product = Provider.of<Product>(
        context); //Provider -> Class-wide data management way ...
    //final cart = Provider.of<Cart>(context, listen: false);

    void add_product_to_cart(Cart cart) {

      cart.addCartItem(
        product.id,
        product.title,
        product.price,
      );

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${product.title} has been added to cart!"),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: "UNDO",
            onPressed: () {
              final product_count = cart.productCartCount(product.id);
              if( product_count > 1) {
                cart.updateCartItemQty(product.id, product_count - 1);
              } else {
                cart.deleteCartItem(product.id);
              }
            },
          ),
        ),
      );
    }

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
            trailing: Consumer<Cart>(
              builder: (ctx, cart, _) {
                return cart.productCartCount(product.id) == 0
                    ? IconButton(
                        onPressed: () {
                          // cart.addCartItem(
                          //   product.id,
                          //   product.title,
                          //   product.price,
                          // );
                          add_product_to_cart(cart);
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
                            // cart.addCartItem(
                            //   product.id,
                            //   product.title,
                            //   product.price,
                            // );
                            add_product_to_cart(cart);
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
