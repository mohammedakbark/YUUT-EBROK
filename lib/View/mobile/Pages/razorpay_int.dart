import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'package:yuutebrok/helper/snackbar.dart';

class RazorPayInt extends StatefulWidget {
  double amout;
  RazorPayInt({super.key,required this.amout});

  @override
  State<RazorPayInt> createState() => _RazorPayIntState();
}

class _RazorPayIntState extends State<RazorPayInt> {
  late Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  var api_key = 'rzp_test_SHTeSLAtEZkoms';
  void openCheckout() {
    var options = {
      'key': api_key, // Replace with your Razorpay API key
      'amount': widget.amout * 100, // Amount is in paise, so multiply by 100
      'name': 'YUUT-EBROK',
      'description': 'Payment for your product',
      'prefill': {
        'contact': '1234567890',
        'email': 'test@razorpay.com',
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    showSuccessMessage('PAYMENT-SUCCESSFUL\n${response.orderId}');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showSuccessMessage('PAYMENT-FAILED\n${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    showSuccessMessage('PAYMENT-WALLET\n${response.walletName}');
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear(); // Removes all listeners
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
            },
            child: Text('open')),
      ),
    );
  }
}
