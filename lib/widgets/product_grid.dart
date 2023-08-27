import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import '../models/product.dart';

import '../providers/product_list.dart';

import '../widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  
  final bool isFavorite;

  const ProductGrid({
    super.key,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {

    final productList = isFavorite ? Provider.of<ProductList>(context).productFavoriteList : Provider.of<ProductList>(context).productList;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, idx) {
        return ChangeNotifierProvider.value(
          value: productList[idx],
          child: const ProductItem(
              // id: productList[idx].id,
              // title: productList[idx].title,
              // imageUrl: productList[idx].imageUrl,
              ),
        );
      },
      itemCount: productList.length,
    );
  }
}
