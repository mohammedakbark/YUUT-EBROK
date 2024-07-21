import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yuutebrok/Const/colors.dart';
import 'package:yuutebrok/Const/const.dart';
import 'package:yuutebrok/Const/style.dart';

class SlideProductImage extends StatelessWidget {
  int imageLength;
  SlideProductImage({super.key, required this.imageLength});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: imageLength,
      child: SizedBox(
        height: h(context) * .6,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.antiAlias,
          shrinkWrap: true,
          itemCount: imageLength,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(right: 10),
            width: w(context),
            decoration: BoxDecoration(color: white),
          ),
        ),
      ),
    );
  }
}
