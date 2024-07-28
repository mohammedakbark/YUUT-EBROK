import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yuutebrok/Const/const_string.dart';
import 'package:yuutebrok/Model/cart_model.dart';

class HiveDatabase with ChangeNotifier {
  int _cartLenght = 0;

  int get cartLenght => _cartLenght;

  List<CartModel> cartList = [];
  Future<void> addToCart(CartModel cartModel) async {
    cartList.clear();
    cartList = [];
    final cartBox = await Hive.openBox<CartModel>(ConstString.cartDatabase);

    cartBox.put(cartModel.cartId, cartModel);

    _cartLenght = 0;
    cartList.addAll(cartBox.values);
    _cartLenght = cartList.length;

    notifyListeners();
  }

  Future<List<CartModel>> getMyCart() async {
    cartList.clear();
    cartList = [];
    _cartLenght = 0;

    final cartBox = await Hive.openBox<CartModel>(ConstString.cartDatabase);

    cartList.addAll(cartBox.values);

    _cartLenght = cartList.length;
    return cartList;
  }

  Future<void> deleteFromCart(String id) async {
    log('-deleting...');
    final cartBox = await Hive.openBox<CartModel>(ConstString.cartDatabase);

    cartBox.delete(id);

    notifyListeners();
  }
}
