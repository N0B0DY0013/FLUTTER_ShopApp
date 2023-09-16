import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_list.dart';

import '../widgets/user_product_item.dart';
import '../widgets/drawer.dart';

import '../screens/edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {

  static const routeName = "UserProductScreen";

  const UserProductScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProduct.routeName, arguments: {"type": "new", "prodId": ""});
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productData.productList.length,
          itemBuilder: (_, idx) {
            return Column(
              children: [
                UserProductItem(
                  productId: productData.productList[idx].id,
                  title: productData.productList[idx].title,
                  imageUrl: productData.productList[idx].imageUrl,
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
