import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/Mobil%20View/Pages/view_single_product_detail.dart';
import 'package:yuutebrok/View/utils/appbar_home.dart';
import 'package:yuutebrok/View/utils/loading_indicator.dart';
import 'package:yuutebrok/View/widgets/app_bottom.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';

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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 2,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(createRoute(const ViewSingleProductPage()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1 / 1.5,
                        child: Container(
                          color: white,
                        ),
                      ),
                      Text(
                        "YUUT EBROK",
                        style: appTextstyle(),
                      ),
                      Text(
                        "₹ 100.00",
                        style: appTextstyle(),
                      ),
                    ],
                  ),
                );
              },
            ),
            const AppBottom()
          ],
        ),
      )),
    );
  }
}
