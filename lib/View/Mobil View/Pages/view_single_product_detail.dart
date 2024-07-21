import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/style.dart';
import 'package:yuutebrok/View/utils/appbar_home.dart';
import 'package:yuutebrok/View/widgets/app_bottom.dart';
import 'package:yuutebrok/View/widgets/custome_button.dart';
import 'package:yuutebrok/View/widgets/custome_ex_tile.dart';
import 'package:yuutebrok/View/widgets/custome_margine.dart';
import 'package:yuutebrok/View/widgets/custome_spacer.dart';
import 'package:yuutebrok/View/widgets/image_slide.dart';

class ViewSingleProductPage extends StatelessWidget {
  const ViewSingleProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commmonAppbar(context),
      body: CustomMargin(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlideProductImage(imageLength: 3),
              CusstomeSpacer(
                size: .02,
              ),
              Text(
                "Product Name",
                style: appTextstyle(size: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "₹ 100.00",
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
                onPressed: () {},
                textColor: white,
              ),
              CusstomeSpacer(
                size: .01,
              ),
              CustomeButton(
                title: 'Buy it now',
                bgColor: white,
                onPressed: () {},
                textColor: black,
              ),
              CusstomeSpacer(
                size: .04,
              ),
              CustomeExpantionTile(
                title: 'PRODUCT DETAILS',
                child: Text(
                  'product Description product Description product Description product Description product Description product Description product Description product Description product Description product Description product Description product Description ',
                  style: appTextstyle(size: 16),
                ),
              ),
              CustomeExpantionTile(
                title: 'PRODUCT DIMENSIONS',
                child: Text(
                  'product Description product Description product Description product Description product Description product Description product Description product Description product Description product Description product Description product Description ',
                  style: appTextstyle(size: 16),
                ),
              ),
              CustomeExpantionTile(
                title: 'DELIVERY & RETURN',
                child: Text(
                  'product Description product Description product Description product Description product Description product Description product Description product Description product Description product Description product Description product Description ',
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
