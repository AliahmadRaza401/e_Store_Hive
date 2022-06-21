// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../model/product_model.dart';

class CartProvider with ChangeNotifier {
  String _cartBox = 'cart';
  List _cartList = <CartModel>[];
  List get cartList => _cartList;
  int totalPrice = 0;

  addCartItem(CartModel product) async {
    var box = await Hive.openBox<CartModel>(_cartBox);
    box.add(product);
    notifyListeners();
  }

  getCartItem() async {
    final box = await Hive.openBox<CartModel>(_cartBox);
    _cartList = box.values.toList();

    notifyListeners();
  }

  updateCartItem(int index, CartModel product) {
    final box = Hive.box<CartModel>(_cartBox);

    box.putAt(index, product);

    notifyListeners();
  }

  deleteCartItem(int index) {
    final box = Hive.box<CartModel>(_cartBox);
    box.deleteAt(index);
    getCartItem();

    notifyListeners();
  }

  calculateTotalPrice() {
   

    for (var i = 0; i < _cartList.length; i++) {
      int price = int.parse(_cartList[i].price);
      int quantity  = int.parse(_cartList[i].quantity );
      totalPrice = totalPrice + price * quantity;
      print('totalPrice: ${totalPrice}');
    }

    notifyListeners();
  }
}
