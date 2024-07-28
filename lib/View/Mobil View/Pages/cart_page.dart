import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/Model/cart_model.dart';
import 'package:yuutebrok/Model/product_model.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/auth/login_screen.dart';
import 'package:yuutebrok/View/utils/appbar_home.dart';
import 'package:yuutebrok/View/utils/loading_indicator.dart';
import 'package:yuutebrok/View/widgets/app_bottom.dart';
import 'package:yuutebrok/View/widgets/custome_button.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/controller/data/database.dart';
import 'package:yuutebrok/controller/data/hive_database.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: emptyAppBar(),
        body: CustomMargin(
          child: Consumer<HiveDatabase>(builder: (context, hiveController, _) {
            return FutureBuilder(
                future: hiveController.getMyCart(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingAnimatedLogo();
                  }

                  return hiveController.cartList.isEmpty
                      ? Center(
                          child: SizedBox(
                            height: h(context),
                            width: w(context),
                            child: Center(
                              child: Text(
                                "Your bag is empty !",
                                style: appTextstyle(size: 28),
                              ),
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: hiveController.cartList.length,
                                  itemBuilder: (context, index) {
                                    return FutureBuilder(
                                        future: FirebaseData()
                                            .getSelectedProductDetails(
                                                hiveController
                                                    .cartList[index].productId),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const LoadingAnimatedLogo();
                                          }
                                          ProductModel product =
                                              ProductModel.fromJson(
                                                  snapshot.data!.data()!);
                                          return Stack(
                                            alignment: Alignment.topRight,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 20),
                                                margin:
                                                    const EdgeInsets.all(20),
                                                width: w(context),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: h(context) * .13,
                                                      color: Colors.white,
                                                      width: w(context) * .2,
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            product.image[0],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              w(context) * .4,
                                                          child: Text(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            product.name,
                                                            style: appTextstyle(
                                                                size: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200),
                                                          ),
                                                        ),
                                                        Text(
                                                          "₹ ${product.prize.toDouble()}",
                                                          style: appTextstyle(
                                                              size: 18),
                                                        ),
                                                        Text(
                                                          'Size : S',
                                                          style: appTextstyle(
                                                              size: 18),
                                                        ),
                                                        Container(
                                                          height:
                                                              h(context) * .04,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color:
                                                                      white)),
                                                          child: Row(
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon: Icon(
                                                                    CupertinoIcons
                                                                        .minus,
                                                                    size: 12,
                                                                    color: grey,
                                                                  )),
                                                              Text(
                                                                '1',
                                                                style:
                                                                    appTextstyle(
                                                                        size:
                                                                            22),
                                                              ),
                                                              IconButton(
                                                                  onPressed:
                                                                      () async {},
                                                                  icon: Icon(
                                                                    size: 12,
                                                                    CupertinoIcons
                                                                        .add,
                                                                    color: grey,
                                                                  ))
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () async {
                                                    await hiveController
                                                        .deleteFromCart(
                                                            hiveController
                                                                .cartList[index]
                                                                .cartId);
                                                  },
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: white,
                                                  ))
                                            ],
                                          );
                                        });
                                  }),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                  const AppBottom()
                                ],
                              )
                            ],
                          ),
                        );
                });
          }),
        ));
  }
}
