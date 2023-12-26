import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import './product.dart';

import '../dummy_data.dart';

class ProductList with ChangeNotifier {
  final List<Product> _productList = DUMMY_DATA;
  final base_uri = "flutter-shop-app-3647c-default-rtdb.asia-southeast1.firebasedatabase.app";

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

  Future insertProduct(Product newProduct) {

    return http.post(
      Uri.https(base_uri, "/products.json"),
      body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'imageUrl': newProduct.imageUrl,
        'price': newProduct.price,
        'isFavorite': newProduct.isFavorite
      }),
    ).then((response) {
      //newProduct.id = value.toString();
      _productList.add(Product(
          id: jsonDecode(response.body)["name"],
          title: newProduct.title,
          description: newProduct.description,
          price: newProduct.price,
          imageUrl: newProduct.imageUrl));

      notifyListeners();

    }).catchError((error) {
        //print(error);
        throw error;
    });

    //_productList.add(newProduct);
    //notifyListeners();
    
  }

  void updateProduct(Product existingProduct) {
    final idx = _productList.indexWhere((element) {
      return element.id == existingProduct.id;
    });

    if (idx > -1) {
      _productList[idx] = existingProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String productId) {
    final idx = _productList.indexWhere((element) {
      return element.id == productId;
    });

    if (idx > -1) {
      _productList.removeAt(idx);
      notifyListeners();
    }
  }
}
