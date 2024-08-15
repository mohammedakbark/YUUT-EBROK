import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Model/order_model.dart';
import 'package:yuutebrok/controller/auth/authentication.dart';
import 'package:yuutebrok/controller/data/database.dart';
import 'package:yuutebrok/controller/data/hive_database.dart';
import 'package:yuutebrok/helper/snackbar.dart';
import 'package:razorpay_web/razorpay_web.dart';


class PaymentService with ChangeNotifier {
  late Razorpay _razorpay;

  AuthenticationController? _authController;
  HiveDatabase? _hiveDatabase;
  void initService(
      AuthenticationController authcontroller, HiveDatabase hiveDatabase) {
    _authController = authcontroller;
    _hiveDatabase = hiveDatabase;

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  PaymentFailureResponse? failureResponse;
  PaymentSuccessResponse? successResponse;

  void _handlePaymentSuccess(
    PaymentSuccessResponse response,
  ) {
    showSuccessMessage('PAYMENT-SUCCESSFUL\n${response.orderId}');
    successResponse = response;
    OrderModel _orderModel = OrderModel(
        uid: FirebaseAuth.instance.currentUser!.uid,
        address: _authController!.addressModel,
        products: _hiveDatabase!.cartList,
        response: SuccessRespose(
            rezorpaySignature: response.signature ?? '',
            rezorpayOrderId: response.orderId ?? '',
            rezorpayPayementId: response.paymentId ?? ''),
        status: 'Pending',
        totalAmout: _hiveDatabase!.tottalAmount.toString());

    // print(_hiveDatabase.totalAmout);
    // print(_orderModel.products.length.toString());
    // print(_orderModel.address.city);
    // print(_orderModel.response.rezorpayOrderId);
    FirebaseData().makeAOrder(_orderModel);
    log(response.toString());
    _hiveDatabase!.clearCartItems();
    notifyListeners();
  }

  void _handlePaymentError(
    PaymentFailureResponse response,
  ) {
    showSuccessMessage('PAYMENT-FAILED\n${response.message}');
    failureResponse = response;
    notifyListeners();
  }

  void _handleExternalWallet(ExternalWalletResponse response, context) {
    showSuccessMessage('PAYMENT-WALLET\n${response.walletName}');
  }

  void disposeService() {
    _razorpay.clear();
    failureResponse = null;
    successResponse = null;

    log('---payment-service-disposed----');
  }

  var api_key = 'rzp_test_SHTeSLAtEZkoms';
  void openCheckout(double amount, BuildContext context) {
    final authController =
        Provider.of<AuthenticationController>(context, listen: false);

    var options = {
      'key': api_key, // Replace with your Razorpay API key
      'amount': amount * 100, // Amount is in paise, so multiply by 100
      'name': 'YUUT-EBROK',
      'description': 'Payment for your product',
      'prefill': {
        'contact': authController.addressModel.phoneNumber,
        'email': authController.addressModel.email,
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
