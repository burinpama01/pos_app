import 'package:flutter/material.dart';

import 'package:posapp/models//products.dart';
import 'package:posapp/services/products.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> productsList = [];
  ProductsServices _productsServices = ProductsServices();

  ProductsProvider() {
    loadProducts();
  }
  Future loadProducts() async {
    productsList = (await _productsServices.getProducts()).cast<Product>();
    notifyListeners();
  }
}
