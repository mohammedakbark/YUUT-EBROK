import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/const_string.dart';
import 'package:yuutebrok/Model/cart_model.dart';
import 'package:yuutebrok/Model/product_model.dart';
import 'package:yuutebrok/controller/data/hive_database.dart';

class FirebaseData {
  final db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllProduct(context) {
    return db.collection(ConstString.productCollection).snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getSelectedProductDetails(
      String id) async {
    return db.collection(ConstString.productCollection).doc(id).get();
  }
}
