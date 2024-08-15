import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/mobile/screens/home/viewproducts_page.dart';
import 'package:yuutebrok/View/widgets/custome_button.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';
import 'package:yuutebrok/controller/auth/authentication.dart';
import 'package:yuutebrok/controller/data/hive_database.dart';
import 'package:yuutebrok/controller/payment_service.dart';
import 'package:yuutebrok/utils/loading_indicator.dart';
import 'package:razorpay_web/razorpay_web.dart';


class RazorPayInt extends StatefulWidget {
  double amount;
  RazorPayInt({super.key, required this.amount});

  @override
  State<RazorPayInt> createState() => _RazorPayIntState();
}

class _RazorPayIntState extends State<RazorPayInt> {
  @override
  void initState() {
    super.initState();
    final paymentService = Provider.of<PaymentService>(context, listen: false);
        final autController = Provider.of<AuthenticationController>(context, listen: false);
                final hiveController = Provider.of<HiveDatabase>(context, listen: false);


    paymentService.initService(autController,hiveController);
    Future.delayed(const Duration(seconds: 5));
    paymentService.openCheckout(widget.amount, context);
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<PaymentService>(context, listen: false).disposeService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<PaymentService>(builder: (context, paymentService, _) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (paymentService.failureResponse == null &&
                paymentService.successResponse == null)
              const Center(child: LoadingAnimatedLogo()),
            if (paymentService.failureResponse != null)
              _buildFailureContent(paymentService.failureResponse!),
            if (paymentService.successResponse != null)
              _buildSuccessContent(paymentService.successResponse!),
          ],
        ),
      );
    }));
  }

  Widget _buildSuccessContent(PaymentSuccessResponse response) {
    return CustomMargin(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Payment Successful',
              style: appTextstyle(size: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text('Payment ID: ${response.paymentId}',
              style: appTextstyle(size: 15, fontWeight: FontWeight.w500)),
          Text('Order ID: ${response.orderId}',
              style: appTextstyle(size: 15, fontWeight: FontWeight.w500)),
          Text('Signature: ${response.signature}',
              style: appTextstyle(size: 15, fontWeight: FontWeight.w500)),
          CusstomeSpacer(
            size: .04,
          ),
          _customeButton('Back to Home')
        ],
      ),
    );
  }

  Widget _buildFailureContent(PaymentFailureResponse response) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Failed',
            style: appTextstyle(size: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Text('Error Code: ${response.code}',
            style: appTextstyle(size: 15, fontWeight: FontWeight.w500)),
        Text('Error Message: ${response.message}',
            style: appTextstyle(size: 15, fontWeight: FontWeight.w500)),
        CusstomeSpacer(
          size: .04,
        ),
        _customeButton('Retry'),
      ],
    );
  }

  Widget _customeButton(String title) {
    return CustomeButton(
        bgColor: white,
        textColor: black,
        onPressed: () {
          if (mounted) {
                Provider.of<PaymentService>(context, listen: false).disposeService();

            Navigator.of(context).pushAndRemoveUntil(
                createRoute(const ProductViewPageMobile()), (route) => false);
          }
        },
        title: title);
  }
}
