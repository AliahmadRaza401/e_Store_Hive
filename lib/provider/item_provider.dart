import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/product_model.dart';

class ProductProvider with ChangeNotifier {
  String _productBox = 'product';

  List _productList = <Product>[];

  List get productList => _productList;

  addProductItem(Product product) async {
    var box = await Hive.openBox<Product>(_productBox);

    box.add(product);

    print('added');

    notifyListeners();
  }

  getProductItem() async {
    final box = await Hive.openBox<Product>(_productBox);
    _productList = box.values.toList();

    notifyListeners();
  }

  updateProductItem(int index, Product product) {
    final box = Hive.box<Product>(_productBox);

    box.putAt(index, product);

    notifyListeners();
  }

  deleteProductItem(int index) {
    final box = Hive.box<Product>(_productBox);

    box.deleteAt(index);

    getProductItem();

    notifyListeners();
  }
}
