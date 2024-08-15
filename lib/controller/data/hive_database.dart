import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yuutebrok/Const/const_string.dart';
import 'package:yuutebrok/Model/cart_model.dart';
import 'package:yuutebrok/controller/data/database.dart';
import 'package:yuutebrok/helper/snackbar.dart';

class HiveDatabase with ChangeNotifier {
  int _cartLenght = 0;
  double _totalAmount = 0;
  List<CartModel> _cartList = [];

  int get cartLenght => _cartLenght;
  double get tottalAmount => _totalAmount;
  List<CartModel> get cartList => _cartList;

  Future<bool> _checkTheItemAlreadyInCart(key) async {
    final cartBox = await Hive.openBox<CartModel>(ConstString.cartDatabase);
    final outPut = cartBox.get(
      key,
    );

    if (outPut == null) {
      log('the item not exisit');
      return false;
    } else {
      log('the item already exist');
      return true;
    }
  }

  Future<void> addToCart(CartModel cartModel) async {
    final snapshot = await _checkTheItemAlreadyInCart(cartModel.cartId);
    if (!snapshot) {
      _cartList.clear();

      final cartBox = await Hive.openBox<CartModel>(ConstString.cartDatabase);

      cartBox.put(cartModel.cartId, cartModel);

      _cartLenght = 0;
      _cartList.addAll(cartBox.values);
      _cartLenght = _cartList.length;
      showSuccessMessage('Product added to cart');
      notifyListeners();
    } else {
      showWarningMessage('this item already in your cart !!');
    }
  }

  Future<List<CartModel>> getMyCart() async {
    _cartList.clear();
    _cartList = [];
    _cartLenght = 0;

    final cartBox = await Hive.openBox<CartModel>(ConstString.cartDatabase);

    _cartList.addAll(cartBox.values);

    print(_cartList[0].quantity);

    _cartLenght = _cartList.length;
    await _getTotalAmount();

    return _cartList;
  }

  Future<void> deleteFromCart(String id) async {
    log('-deleting...');
    final cartBox = await Hive.openBox<CartModel>(ConstString.cartDatabase);

    cartBox.delete(id);
    await _getTotalAmount();

    notifyListeners();
  }

  Future<void> clearCartItems() async {
    final cartBox = await Hive.openBox<CartModel>(ConstString.cartDatabase);
    cartBox.clear();
    log('Cart Clear');
  }

  Future<void> editQuantity(key, bool isAdd) async {
    final cartBox = await Hive.openBox<CartModel>(ConstString.cartDatabase);
    var updatingModel = cartBox.get(key);

    if (isAdd) {
      if (updatingModel!.quantity >= 1 && updatingModel.quantity < 10) {
        updatingModel.quantity = _addQuantity(updatingModel.quantity);

        await cartBox.put(key, updatingModel);
        await _getTotalAmount();
        notifyListeners();
      } else {
        showWarningMessage('limit upto 10');
      }
    } else {
      if (updatingModel!.quantity > 1) {
        updatingModel.quantity = _lessQuantity(updatingModel.quantity);

        await cartBox.put(key, updatingModel);
        await _getTotalAmount();

        notifyListeners();
      } else {
        showWarningMessage('add min. 1');
      }
    }
  }

  _addQuantity(double value) {
    value++;
    return value;
  }

  _lessQuantity(double value) {
    value--;
    return value;
  }

  final FirebaseData _dataBase = FirebaseData();

  _getTotalAmount() async {
    _totalAmount = 0;
    for (var cart in _cartList) {
      try {
        final snapshot =
            await _dataBase.getSelectedProductDetails(cart.productId);
        if (snapshot.exists) {
          double prize = snapshot.data()!['prize'];
          _totalAmount += cart.quantity * prize;
          log(_totalAmount.toString());
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
