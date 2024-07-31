import 'dart:developer';

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
import 'package:yuutebrok/View/Mobil%20View/Pages/auth/login_screen.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/cart_page.dart';
import 'package:yuutebrok/View/utils/appbar_home.dart';
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
    return Scaffold(
      appBar: commmonAppbar(context),
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
              CusstomeSpacer(
                size: .01,
              ),
              CusstomeSpacer(
                size: .04,
              ),
              CustomeButton(
                title: 'Add to cart',
                bgColor: black,
                onPressed: () async {
                 
                  Provider.of<HiveDatabase>(context, listen: false).addToCart(
                      CartModel(
                          cartId: productModel.productId!,
                          productId: productModel.productId!,
                          quantity: 1.0));
                
                },
                textColor: white,
              ),
              CusstomeSpacer(
                size: .01,
              ),
              CustomeButton(
                title: 'Buy it now',
                bgColor: white,
                onPressed: () {
                  if (AuthenticationController()
                      .checkUserAuthenticationStatus()) {
                    Navigator.of(context).push(createRoute(CartPage()));
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
