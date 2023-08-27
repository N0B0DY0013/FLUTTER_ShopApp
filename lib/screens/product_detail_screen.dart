import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_list.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
  });

  static const routeName = "/product-detail-screen";

  @override
  Widget build(BuildContext context) {
    final prodId = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<ProductList>(context, listen: false).getProductByID(prodId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body:  Center(
        child: Text(product.description),
      ),
    );
  }
}
