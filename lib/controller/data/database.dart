import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/const_string.dart';
import 'package:yuutebrok/Model/cart_model.dart';
import 'package:yuutebrok/Model/order_model.dart';
import 'package:yuutebrok/Model/product_model.dart';
import 'package:yuutebrok/controller/data/hive_database.dart';
import 'package:yuutebrok/helper/snackbar.dart';

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

  Future editTheProductQuantity(String id, int qtyForReduce) async {
    final snapshot = await getSelectedProductDetails(id);
    if (snapshot.exists) {
      final currentQuantity = snapshot.data()!['quantity'];
      final finalQuantity = currentQuantity - qtyForReduce;

      await db
          .collection(ConstString.productCollection)
          .doc(id)
          .update({'quantity': finalQuantity});
    }
  }

  Future<void> makeAOrder(OrderModel orderModel) async {
    final doc = db.collection(ConstString.oderCollection).doc();
    await doc.set(orderModel.toJson(doc.id));
    for (var cartItem in orderModel.products) {
      editTheProductQuantity(cartItem.productId, cartItem.quantity.toInt());
    }
    showSuccessMessage('ORDER-SUCCESSFUL');
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMyOrders() {
    return db
        .collection(ConstString.oderCollection)
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

Stream<DocumentSnapshot<Map<String, dynamic>>> getTheInfoOfAdmin() {
   return db.collection(ConstString.socilaMediaLink).doc('yuut_ebroke').snapshots();
  }
}
