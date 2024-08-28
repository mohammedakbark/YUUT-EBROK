import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/Model/order_model.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/controller/data/database.dart';
import 'package:yuutebrok/utils/loading_indicator.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
        title: Text(
          'My Orders',
          style: appTextstyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomMargin(
        child: FirebaseAuth.instance.currentUser == null
            ? Center(
                child: Text(
                  'No Orders',
                  style: appTextstyle(),
                ),
              )
            : FutureBuilder(
                future: FirebaseData().getMyOrders(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingAnimatedLogo();
                  }
                  List<OrderModel> myOrders = snapshot.data!.docs
                      .map((e) => OrderModel.fromJson(e.data()))
                      .toList();
                  return myOrders.isEmpty
                      ? Center(
                          child: Text(
                            'No Orders',
                            style: appTextstyle(),
                          ),
                        )
                      : ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                          itemCount: myOrders.length,
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: white),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      myOrders[index]
                                          .timestamp!
                                          .toDate()
                                          .toString(),
                                      style: appTextstyle(),
                                    ),
                                    Text(
                                      myOrders[index].orderId!,
                                      style: appTextstyle(size: 8),
                                    ),
                                  ],
                                ),
                                Text(
                                  myOrders[index].status,
                                  style: appTextstyle(),
                                ),
                              ],
                            ),
                          ),
                        );
                }),
      ),
    );
  }
}
