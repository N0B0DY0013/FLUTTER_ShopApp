import 'package:flutter/material.dart';

import './product.dart';

import '../dummy_data.dart';

class ProductList with ChangeNotifier {

  final List<Product> _productList = DUMMY_DATA;

  List<Product> get productList {
    //returns a copy of the '_productList'
    return [..._productList];
  }

  List<Product> get productFavoriteList {
    return _productList.where((product) {
      return product.isFavorite;
    }).toList();
  }

  Product getProductByID(String id) {
    return _productList.firstWhere((product) {
      return product.id == id;
    });
  }
}
