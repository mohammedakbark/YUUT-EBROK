import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/Model/product_model.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/view_single_product_detail.dart';
import 'package:yuutebrok/View/utils/appbar_home.dart';
import 'package:yuutebrok/View/utils/loading_indicator.dart';
import 'package:yuutebrok/View/widgets/app_bottom.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';
import 'package:yuutebrok/controller/data/database.dart';

class ProductViewPageMobile extends StatelessWidget {
  const ProductViewPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commmonAppbar(context),
      body: CustomMargin(
          child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
                style: appTextstyle(),
                cursorColor: white,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: "SEARCH",

                  // suffixIconConstraints: BoxConstraints(),
                  // suffixIcon: ImageIcon(
                  //   searchImage,
                  //   color: white,
                  // ),
                  hintStyle: appTextstyle(letterSpacing: 1.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: white, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: white, width: 1)),
                )),
            CusstomeSpacer(
              size: .01,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseData().getAllProduct(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingAnimatedLogo();
                  }
                  if (!snapshot.hasData) {
                    return SizedBox();
                  }

                  final List<ProductModel> listOfProduct = snapshot.data!.docs
                      .map((e) => ProductModel.fromJson(e.data()))
                      .toList();
                  return listOfProduct.isEmpty
                      ? Center(
                          child: Text(
                            "No Items",
                            style: appTextstyle(),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listOfProduct.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1 / 2,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            final product = listOfProduct[index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(createRoute(ViewSingleProductPage(
                                  productModel: product,
                                )));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1 / 1.5,
                                    child: Container(
                                      color: white,
                                      child: CachedNetworkImage(
                                          imageUrl: product.image[0]),
                                    ),
                                  ),
                                  Text(
                                    product.name.toUpperCase(),
                                    style: appTextstyle(),
                                  ),
                                  Text(
                                    "₹ ${product.prize.toDouble()}",
                                    style: appTextstyle(),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                }),
            const AppBottom()
          ],
        ),
      )),
    );
  }
}
