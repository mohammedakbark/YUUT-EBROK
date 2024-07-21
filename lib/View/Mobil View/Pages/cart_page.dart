import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/auth/login_screen.dart';
import 'package:yuutebrok/View/utils/appbar_home.dart';
import 'package:yuutebrok/View/widgets/app_bottom.dart';
import 'package:yuutebrok/View/widgets/custome_button.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: emptyAppBar(),
        body: CustomMargin(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    margin: const EdgeInsets.all(20),
                    width: w(context),
                    child: Row(
                      children: [
                        Container(
                          height: h(context) * .13,
                          color: Colors.white,
                          width: w(context) * .2,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          // height: h(context) * .13,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product Name",
                                style: appTextstyle(
                                    size: 22, fontWeight: FontWeight.w200),
                              ),
                              Text(
                                "₹ 100.00",
                                style: appTextstyle(size: 18),
                              ),
                              Text(
                                'Size : S',
                                style: appTextstyle(size: 18),
                              ),
                              Container(
                                height: h(context) * .04,
                                decoration: BoxDecoration(
                                    border: Border.all(color: white)),
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          CupertinoIcons.minus,
                                          size: 12,
                                          color: grey,
                                        )),
                                    Text(
                                      '1',
                                      style: appTextstyle(size: 22),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          size: 12,
                                          CupertinoIcons.add,
                                          color: grey,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TOTAL',
                          style: appTextstyle(
                              size: 16,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        ),
                        // Spacer(),
                        Text(
                          "₹ 1980.00",
                          style: appTextstyle(),
                        )
                      ],
                    ),
                    CustomeButton(
                      bgColor: white,
                      onPressed: () {
                        if (1 == 1) {
                          Navigator.of(context)
                              .push(createRoute(LoginScreen()));
                        } else {}
                      },
                      title: 'CONTINUE',
                      textColor: black,
                    ),
                    // Expanded(child: SizedBox()),
                    // Spacer(),
                    AppBottom()
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
