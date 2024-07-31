import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:yuutebrok/Const/const_string.dart';
import 'package:yuutebrok/Model/user_model.dart';
import 'package:yuutebrok/helper/snackbar.dart';

class AuthenticationController {
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
  String? _uid;

  String get uid => _uid!;
  UserModel get userModel => _userModel!;

  _registerUser(BuildContext context) async {
    try {
      log(_userModel!.email);
      final snapshot = await _auth.createUserWithEmailAndPassword(
          email: _userModel!.email, password: _userModel!.password);
      log('--------reg. success');
      _uid = snapshot.user!.uid;
    } catch (e) {
      showErrorSnackbar(context, e.toString());
    }
  }

  addUserData(context, UserModel userData) async {
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
}
