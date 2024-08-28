import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/Model/cart_model.dart';
import 'package:yuutebrok/Model/product_model.dart';
import 'package:yuutebrok/View/mobile/screens/auth/login_screen.dart';
import 'package:yuutebrok/View/mobile/screens/check%20out/cart_page.dart';
import 'package:yuutebrok/controller/controller.dart';
import 'package:yuutebrok/utils/appbar_home.dart';
import 'package:yuutebrok/View/widgets/app_bottom.dart';
import 'package:yuutebrok/View/widgets/custome_button.dart';
import 'package:yuutebrok/View/widgets/custome_ex_tile.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';
import 'package:yuutebrok/View/widgets/image_slide.dart';
import 'package:yuutebrok/controller/auth/authentication.dart';
import 'package:yuutebrok/controller/data/hive_database.dart';
import 'package:yuutebrok/helper/snackbar.dart';

class ViewSingleProductPage extends StatelessWidget {
  ProductModel productModel;
  ViewSingleProductPage({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    Provider.of<Controller>(context, listen: false)
        .genarateSizeList(productModel.sizes);

    return Scaffold(
      appBar: commmonAppbar(context, true),
      body: CustomMargin(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlideProductImage(
                images: productModel.image,
              ),
              CusstomeSpacer(
                size: .02,
              ),
              Text(
                productModel.name.toUpperCase(),
                style: appTextstyle(size: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "₹ ${productModel.prize.toDouble()}",
                style: appTextstyle(size: 18),
              ),
              CusstomeSpacer(
                size: .01,
              ),
              SizedBox(
                width: w(context),
                height: h(context) * .08,
                child: Consumer<Controller>(builder: (context, controller, _) {
                  return ListView.builder(
                    itemCount: productModel.sizes.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Center(
                      child: InkWell(
                        onTap: () {
                          if (controller.selectedSizes[index]['isSelected']) {
                            controller.unSelectSize(
                                index,
                                controller.selectedSizes[index]['size'],
                                productModel.sizes);
                          } else {
                            controller.selectSize(
                                index,
                                controller.selectedSizes[index]['size'],
                                productModel.sizes);
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: controller.selectedSizes[index]
                                      ['isSelected']
                                  ? white
                                  : black,
                              border: Border.all(color: white)),
                          child: Text(
                            controller.selectedSizes[index]['size'],
                            style: appTextstyle(
                                color: controller.selectedSizes[index]
                                        ['isSelected']
                                    ? black
                                    : white),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              CusstomeSpacer(
                size: .01,
              ),
              CustomeButton(
                title: 'Add to cart',
                bgColor: black,
                onPressed: () async {
                  if (Provider.of<Controller>(context, listen: false)
                          .selectedSize !=
                      null) {
                    Provider.of<HiveDatabase>(context, listen: false).addToCart(
                        CartModel(
                            size:
                                Provider.of<Controller>(context, listen: false)
                                    .selectedSize!,
                            cartId: productModel.productId!,
                            productId: productModel.productId!,
                            quantity: 1));
                  } else {
                    showErrorMessage('Select the size !!');
                  }
                },
                textColor: white,
              ),
              CusstomeSpacer(
                size: .01,
              ),
              CustomeButton(
                title: 'Buy it now',
                bgColor: white,
                onPressed: () async {
                  if (AuthenticationController()
                      .checkUserAuthenticationStatus()) {
                    if (await AuthenticationController()
                        .chckTheEmailIsVerified()) {
                      if (Provider.of<Controller>(context, listen: false)
                              .selectedSize !=
                          null) {
                        Provider.of<HiveDatabase>(context, listen: false)
                            .addToCart(CartModel(
                                size: Provider.of<Controller>(context,
                                        listen: false)
                                    .selectedSize!,
                                cartId: productModel.productId!,
                                productId: productModel.productId!,
                                quantity: 1))
                            .then((value) {
                          Navigator.of(context)
                              .push(createRoute(const CartPage()));
                        });
                      } else {
                        showErrorMessage('Select the size !!');
                      }
                    } else {
                      FirebaseAuth.instance.currentUser!
                          .sendEmailVerification();
                      showErrorMessage('You email is not verified !');
                      showSuccessMessage(
                          'verification mail send to ${FirebaseAuth.instance.currentUser!.email}');
                    }
                  } else {
                    Navigator.of(context).push(createRoute(LoginScreen()));
                  }
                },
                textColor: black,
              ),
              CusstomeSpacer(
                size: .04,
              ),
              CustomeExpantionTile(
                title: 'PRODUCT DETAILS',
                child: Text(
                  productModel.productDetails,
                  style: appTextstyle(size: 16),
                ),
              ),
              CustomeExpantionTile(
                title: 'PRODUCT DIMENSIONS',
                child: Text(
                  productModel.productDimensions,
                  style: appTextstyle(size: 16),
                ),
              ),
              CustomeExpantionTile(
                title: 'DELIVERY & RETURN',
                child: Text(
                  productModel.deliveryAndRetturn,
                  style: appTextstyle(size: 16),
                ),
              ),
              AppBottom()
            ],
          ),
        ),
      ),
    );
  }
}
