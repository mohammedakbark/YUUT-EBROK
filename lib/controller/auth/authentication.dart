import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:yuutebrok/Const/const_string.dart';
import 'package:yuutebrok/Model/address_model.dart';
import 'package:yuutebrok/Model/user_model.dart';
import 'package:yuutebrok/helper/snackbar.dart';

class AuthenticationController with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  bool checkUserAuthenticationStatus() {
    if (_auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  UserModel? _userModel;
  AddressModel? _addressModel;
  String? _uid;

  String get uid => _uid!;
  UserModel get userModel =>
      _userModel ?? UserModel(email: '', name: '', phone: '', password: '');
  AddressModel get addressModel => _addressModel!;

  void storeAdress(AddressModel addressModel) {
    _addressModel = addressModel;

  }

  _registerUser(BuildContext context) async {
    try {
      log(_userModel!.email);
      final snapshot = await _auth.createUserWithEmailAndPassword(
          email: _userModel!.email, password: _userModel!.password);
      log('--------reg. success');
      _uid = snapshot.user!.uid;
      showSuccessSnackbar(context, 'REGISTRATION SUCCESS');
    } catch (e) {
      showErrorSnackbar(context, e.toString());
    }
  }

  loginUser(context, String email, String password) async {
    try {
      final snapshot = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _uid = snapshot.user!.uid;
      showSuccessSnackbar(context, 'LOGIN SUCCESS');
      await getUserData(context);
    } catch (e) {
      showErrorSnackbar(context, e.toString());
    }
  }

  Future<void> addUserData(context, UserModel userData) async {
    _userModel = userData;
    await _registerUser(
      context,
    );
    try {
      if (_uid != null) {
        await _db
            .collection(ConstString.userCollection)
            .doc(_uid)
            .set(_userModel!.toJson(_uid));
        showSuccessSnackbar(context, 'Registration Successful !!');
      }
    } catch (e) {
      showErrorSnackbar(context, e.toString());
    }
  }

  Future<void> getUserData(context) async {
    try {
      final snapshot = await _db
          .collection(ConstString.userCollection)
          .doc(_auth.currentUser!.uid)
          .get();
      if (snapshot.exists) {
        _userModel = UserModel.fromjson(snapshot.data()!);
        log('------fetched UserData');
      }
    } catch (e) {
      showErrorSnackbar(context, e.toString());
    }
  }

  void clearAuth() async {
    await _auth.signOut();
  }
}
