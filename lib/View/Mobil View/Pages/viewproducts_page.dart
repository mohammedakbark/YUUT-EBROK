import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/media.dart';
import 'package:yuutebrok/View/utils/loading_indicator.dart';

class ProductViewPageMobile extends StatelessWidget {
  const ProductViewPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: logoText,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(height * .06),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                  cursorColor: white,
                  decoration: InputDecoration(
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
            )),

        // leading: Image.asset(
        //   logo,
        //   scale: 40,
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 2,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showLoadingIndiactor(context);
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
      ),
    );
  }
}
