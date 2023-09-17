import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_list.dart';

import '../screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String productId;
  final String title;
  final String imageUrl;

  const UserProductItem({
    required this.productId,
    required this.title,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProduct.routeName,
                    arguments: {"type": "existing", "prodId": productId});
              },
              icon: const Icon(
                Icons.edit,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: const Text("Are you sure?"),
                      content:
                          const Text("Do you want to remove this product?"),
                      actions: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.orange[900],
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text("No"),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                            Provider.of<ProductList>(context, listen: false)
                                .deleteProduct(productId);
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
              ),
            )
          ],
        ),
      ),
    );
  }
}
